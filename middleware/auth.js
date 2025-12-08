const jwt = require('jsonwebtoken');

// Middleware pour vérifier le token JWT
const verifyToken = (req, res, next) => {
    const token = req.headers['authorization']?.split(' ')[1];

    if (!token) {
        return res.status(403).json({
            success: false,
            message: 'Aucun token fourni'
        });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded;
        next();
    } catch (error) {
        return res.status(401).json({
            success: false,
            message: 'Token invalide ou expiré'
        });
    }
};

// Middleware pour vérifier que l'utilisateur est un patron (boss)
const verifyBoss = (req, res, next) => {
    if (!req.user) {
        return res.status(403).json({
            success: false,
            message: 'Non authentifié'
        });
    }

    // Vérifier si le grade est suffisant (généralement grade 3 ou 4 pour les patrons)
    if (req.user.job_grade < 2) {
        return res.status(403).json({
            success: false,
            message: 'Accès refusé. Vous devez être patron d\'entreprise.'
        });
    }

    next();
};

module.exports = { verifyToken, verifyBoss };
