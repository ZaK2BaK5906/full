const express = require('express');
const router = express.Router();
const { pool } = require('../config/database');
const { verifyToken, verifyBoss } = require('../middleware/auth');

// Appliquer les middlewares à toutes les routes
router.use(verifyToken);
router.use(verifyBoss);

// Récupérer les informations du compte de l'entreprise
router.get('/society-account', async (req, res) => {
    try {
        const societyName = `society_${req.user.job}`;

        // Récupérer le solde de l'entreprise
        const [accounts] = await pool.query(
            'SELECT money FROM addon_account_data WHERE account_name = ? AND owner IS NULL',
            [societyName]
        );

        // Récupérer les informations du compte bancaire p_bank
        const [bankAccounts] = await pool.query(
            'SELECT * FROM p_bank_accounts WHERE owner = ? AND type = ?',
            [societyName, 'society']
        );

        if (accounts.length === 0 && bankAccounts.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Compte de l\'entreprise non trouvé'
            });
        }

        let balance = 0;
        let transactions = [];
        let logs = [];

        if (accounts.length > 0) {
            balance = accounts[0].money;
        }

        if (bankAccounts.length > 0) {
            balance = bankAccounts[0].balance;
            transactions = JSON.parse(bankAccounts[0].transactions || '[]');
            logs = JSON.parse(bankAccounts[0].logs || '[]');
        }

        res.json({
            success: true,
            data: {
                society: req.user.job,
                balance,
                transactions: transactions.slice(-50).reverse(), // Dernières 50 transactions
                logs: logs.slice(-50).reverse() // Derniers 50 logs
            }
        });

    } catch (error) {
        console.error('Erreur lors de la récupération du compte:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur serveur'
        });
    }
});

// Récupérer la liste des employés
router.get('/employees', async (req, res) => {
    try {
        const [employees] = await pool.query(
            'SELECT identifier, firstname, lastname, job_grade FROM users WHERE job = ?',
            [req.user.job]
        );

        res.json({
            success: true,
            data: employees
        });

    } catch (error) {
        console.error('Erreur lors de la récupération des employés:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur serveur'
        });
    }
});

// Faire un virement à un employé
router.post('/transfer', async (req, res) => {
    const connection = await pool.getConnection();

    try {
        const { targetIdentifier, amount, description } = req.body;

        if (!targetIdentifier || !amount || amount <= 0) {
            return res.status(400).json({
                success: false,
                message: 'Données invalides'
            });
        }

        await connection.beginTransaction();

        const societyName = `society_${req.user.job}`;

        // Vérifier le solde de l'entreprise
        const [societyAccounts] = await connection.query(
            'SELECT money FROM addon_account_data WHERE account_name = ? AND owner IS NULL',
            [societyName]
        );

        if (societyAccounts.length === 0 || societyAccounts[0].money < amount) {
            await connection.rollback();
            return res.status(400).json({
                success: false,
                message: 'Solde insuffisant dans le compte de l\'entreprise'
            });
        }

        // Vérifier que le joueur cible existe et fait partie de l'entreprise
        const [targetUser] = await connection.query(
            'SELECT identifier, firstname, lastname, job FROM users WHERE identifier = ?',
            [targetIdentifier]
        );

        if (targetUser.length === 0) {
            await connection.rollback();
            return res.status(404).json({
                success: false,
                message: 'Employé non trouvé'
            });
        }

        if (targetUser[0].job !== req.user.job) {
            await connection.rollback();
            return res.status(403).json({
                success: false,
                message: 'Cet employé ne fait pas partie de votre entreprise'
            });
        }

        // Débiter le compte de l'entreprise
        await connection.query(
            'UPDATE addon_account_data SET money = money - ? WHERE account_name = ? AND owner IS NULL',
            [amount, societyName]
        );

        // Récupérer ou créer le compte bancaire du joueur
        const [playerBankAccounts] = await connection.query(
            'SELECT * FROM p_bank_accounts WHERE owner = ? AND type = ?',
            [targetIdentifier, 'personal']
        );

        if (playerBankAccounts.length === 0) {
            // Créer un compte pour le joueur s'il n'existe pas
            const iban = Math.floor(Math.random() * 10000000000).toString();
            await connection.query(
                'INSERT INTO p_bank_accounts (iban, owner, name, balance, type, transactions) VALUES (?, ?, ?, ?, ?, ?)',
                [iban, targetIdentifier, `${targetUser[0].firstname} ${targetUser[0].lastname}`, amount, 'personal', '[]']
            );
        } else {
            // Mettre à jour le solde et ajouter la transaction
            const currentTransactions = JSON.parse(playerBankAccounts[0].transactions || '[]');
            const newTransaction = {
                id: currentTransactions.length + 1,
                type: 'income',
                from: `Entreprise ${req.user.job}`,
                to: `${targetUser[0].firstname} ${targetUser[0].lastname}`,
                title: description || 'Virement entreprise',
                amount: amount,
                date: Math.floor(Date.now() / 1000)
            };
            currentTransactions.push(newTransaction);

            await connection.query(
                'UPDATE p_bank_accounts SET balance = balance + ?, transactions = ? WHERE owner = ? AND type = ?',
                [amount, JSON.stringify(currentTransactions), targetIdentifier, 'personal']
            );
        }

        // Ajouter la transaction dans le compte de l'entreprise
        const [societyBankAccounts] = await connection.query(
            'SELECT * FROM p_bank_accounts WHERE owner = ? AND type = ?',
            [societyName, 'society']
        );

        if (societyBankAccounts.length > 0) {
            const currentTransactions = JSON.parse(societyBankAccounts[0].transactions || '[]');
            const newTransaction = {
                id: currentTransactions.length + 1,
                type: 'outcome',
                from: `Entreprise ${req.user.job}`,
                to: `${targetUser[0].firstname} ${targetUser[0].lastname}`,
                title: description || 'Virement à employé',
                amount: amount,
                date: Math.floor(Date.now() / 1000)
            };
            currentTransactions.push(newTransaction);

            await connection.query(
                'UPDATE p_bank_accounts SET balance = balance - ?, transactions = ? WHERE owner = ? AND type = ?',
                [amount, JSON.stringify(currentTransactions), societyName, 'society']
            );
        }

        await connection.commit();

        res.json({
            success: true,
            message: `Virement de ${amount}$ effectué avec succès à ${targetUser[0].firstname} ${targetUser[0].lastname}`
        });

    } catch (error) {
        await connection.rollback();
        console.error('Erreur lors du virement:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur lors du virement'
        });
    } finally {
        connection.release();
    }
});

// Récupérer l'historique complet des transactions
router.get('/transactions', async (req, res) => {
    try {
        const societyName = `society_${req.user.job}`;
        const limit = parseInt(req.query.limit) || 100;
        const offset = parseInt(req.query.offset) || 0;

        const [bankAccounts] = await pool.query(
            'SELECT transactions FROM p_bank_accounts WHERE owner = ? AND type = ?',
            [societyName, 'society']
        );

        if (bankAccounts.length === 0) {
            return res.json({
                success: true,
                data: []
            });
        }

        const allTransactions = JSON.parse(bankAccounts[0].transactions || '[]');
        const paginatedTransactions = allTransactions
            .reverse()
            .slice(offset, offset + limit);

        res.json({
            success: true,
            data: {
                transactions: paginatedTransactions,
                total: allTransactions.length
            }
        });

    } catch (error) {
        console.error('Erreur lors de la récupération des transactions:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur serveur'
        });
    }
});

module.exports = router;
