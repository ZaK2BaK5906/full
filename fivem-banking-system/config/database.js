const mysql = require('mysql2/promise');
require('dotenv').config();

// Configuration de la connexion à la base de données
const pool = mysql.createPool({
    host: process.env.DB_HOST || '127.0.0.1',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'zak',
    port: process.env.DB_PORT || 3306,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Test de connexion
async function testConnection() {
    try {
        const connection = await pool.getConnection();
        console.log('✅ Connexion à la base de données réussie');
        connection.release();
        return true;
    } catch (error) {
        console.error('❌ Erreur de connexion à la base de données:', error.message);
        return false;
    }
}

module.exports = { pool, testConnection };
