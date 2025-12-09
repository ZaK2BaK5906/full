const mysql = require('mysql2/promise');
require('dotenv').config();

/**
 * Script de migration des soldes
 * Copie les soldes de addon_account_data vers p_bank_accounts
 *
 * UTILISATION:
 * node migrate-balances.js
 */

async function migrateBalances() {
    console.log('🔄 Début de la migration des soldes...\n');

    const connection = await mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        port: process.env.DB_PORT || 3306
    });

    try {
        // Récupérer tous les soldes de addon_account_data pour les sociétés
        const [addonAccounts] = await connection.query(`
            SELECT account_name, money
            FROM addon_account_data
            WHERE account_name LIKE 'society_%'
            AND owner IS NULL
        `);

        console.log(`📊 Trouvé ${addonAccounts.length} comptes société dans addon_account_data\n`);

        let updated = 0;
        let notFound = 0;

        for (const account of addonAccounts) {
            const societyName = account.account_name;
            const balance = account.money;

            // Mettre à jour le solde dans p_bank_accounts
            const [result] = await connection.query(`
                UPDATE p_bank_accounts
                SET balance = ?
                WHERE owner = ? AND type = 'society'
            `, [balance, societyName]);

            if (result.affectedRows > 0) {
                console.log(`✅ ${societyName.padEnd(30)} : ${balance.toLocaleString().padStart(12)} $ → p_bank_accounts`);
                updated++;
            } else {
                console.log(`⚠️  ${societyName.padEnd(30)} : Compte non trouvé dans p_bank_accounts`);
                notFound++;
            }
        }

        console.log(`\n📈 Résumé:`);
        console.log(`   - Comptes mis à jour: ${updated}`);
        console.log(`   - Comptes non trouvés: ${notFound}`);
        console.log(`\n✅ Migration terminée avec succès!`);

    } catch (error) {
        console.error('❌ Erreur lors de la migration:', error.message);
        throw error;
    } finally {
        await connection.end();
    }
}

// Exécuter la migration
migrateBalances()
    .then(() => {
        console.log('\n🎉 Terminé!');
        process.exit(0);
    })
    .catch((error) => {
        console.error('\n💥 Erreur fatale:', error);
        process.exit(1);
    });
