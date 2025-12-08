const express = require('express');
const cors = require('cors');
const rateLimit = require('express-rate-limit');
require('dotenv').config();

const { testConnection } = require('./config/database');
const authRoutes = require('./routes/auth');
const bankingRoutes = require('./routes/banking');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

// Rate limiting pour éviter les abus
const limiter = rateLimit({
    windowMs: 15 * 60 * 1000, // 15 minutes
    max: 100 // Limite de 100 requêtes par IP
});
app.use('/api/', limiter);

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/banking', bankingRoutes);

// Route de base
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/index.html');
});

// Route de santé
app.get('/api/health', (req, res) => {
    res.json({
        success: true,
        message: 'Serveur opérationnel',
        timestamp: new Date().toISOString()
    });
});

// Gestion des erreurs 404
app.use((req, res) => {
    res.status(404).json({
        success: false,
        message: 'Route non trouvée'
    });
});

// Démarrage du serveur
async function startServer() {
    try {
        // Tester la connexion à la base de données
        const dbConnected = await testConnection();

        if (!dbConnected) {
            console.error('❌ Impossible de démarrer le serveur sans connexion à la base de données');
            process.exit(1);
        }

        app.listen(PORT, () => {
            console.log(`
╔═══════════════════════════════════════════════════════╗
║                                                       ║
║   🏦  Système de Banque d'Entreprise FiveM          ║
║                                                       ║
║   Serveur démarré sur le port ${PORT}                   ║
║   URL: http://localhost:${PORT}                        ║
║                                                       ║
║   Environnement: ${process.env.NODE_ENV || 'development'}                      ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
            `);
        });

    } catch (error) {
        console.error('❌ Erreur lors du démarrage du serveur:', error);
        process.exit(1);
    }
}

startServer();

// Gestion des erreurs non gérées
process.on('unhandledRejection', (error) => {
    console.error('❌ Erreur non gérée:', error);
});

process.on('SIGTERM', () => {
    console.log('👋 Arrêt du serveur...');
    process.exit(0);
});
