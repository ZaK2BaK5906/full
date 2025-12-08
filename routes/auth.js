const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const { pool } = require('../config/database');

// Route de connexion
router.post('/login', async (req, res) => {
    try {
        const { identifier } = req.body;

        if (!identifier) {
            return res.status(400).json({
                success: false,
                message: 'Identifiant manquant'
            });
        }

        // Rechercher l'utilisateur dans la base de données
        const [users] = await pool.query(
            'SELECT identifier, firstname, lastname, job, job_grade FROM users WHERE identifier = ?',
            [identifier]
        );

        if (users.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Utilisateur non trouvé'
            });
        }

        const user = users[0];

        // Vérifier si l'utilisateur est patron (grade >= 2)
        if (user.job_grade < 2) {
            return res.status(403).json({
                success: false,
                message: 'Accès refusé. Vous devez être patron d\'entreprise (grade minimum: 2)'
            });
        }

        // Générer le token JWT
        const token = jwt.sign(
            {
                identifier: user.identifier,
                firstname: user.firstname,
                lastname: user.lastname,
                job: user.job,
                job_grade: user.job_grade
            },
            process.env.JWT_SECRET,
            { expiresIn: `${process.env.SESSION_EXPIRATION || 24}h` }
        );

        res.json({
            success: true,
            message: 'Connexion réussie',
            data: {
                token,
                user: {
                    identifier: user.identifier,
                    firstname: user.firstname,
                    lastname: user.lastname,
                    job: user.job,
                    job_grade: user.job_grade
                }
            }
        });

    } catch (error) {
        console.error('Erreur lors de la connexion:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur serveur'
        });
    }
});

// Route pour vérifier le token
router.get('/verify', async (req, res) => {
    const token = req.headers['authorization']?.split(' ')[1];

    if (!token) {
        return res.status(403).json({
            success: false,
            message: 'Aucun token fourni'
        });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        res.json({
            success: true,
            user: decoded
        });
    } catch (error) {
        res.status(401).json({
            success: false,
            message: 'Token invalide ou expiré'
        });
    }
});

module.exports = router;
