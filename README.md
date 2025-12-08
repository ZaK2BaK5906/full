# 🏦 Système de Banque d'Entreprise FiveM

Un système complet de gestion bancaire pour les entreprises sur serveur FiveM ESX. Permet aux patrons d'entreprise de gérer les finances, effectuer des virements à leurs employés, et consulter l'historique des transactions.

## 📋 Fonctionnalités

- ✅ **Authentification sécurisée** avec JWT
- 💰 **Gestion du compte d'entreprise** (consultation du solde)
- 👥 **Liste des employés** de l'entreprise
- 💸 **Virements aux employés** avec confirmation
- 📊 **Historique complet** des transactions
- 🔐 **Vérification automatique** du grade (seuls les patrons peuvent accéder)
- 📱 **Interface responsive** (fonctionne sur mobile et desktop)
- ⚡ **Mise à jour en temps réel** des données

## 🛠️ Technologies utilisées

### Backend
- Node.js
- Express.js
- MySQL2 (pool de connexions)
- JWT (jsonwebtoken)
- bcryptjs
- CORS
- dotenv
- express-rate-limit (protection contre les abus)

### Frontend
- HTML5
- CSS3 (design moderne et responsive)
- JavaScript vanilla (sans framework)
- Fetch API

## 📦 Installation

### Prérequis
- Node.js (v14 ou supérieur)
- MySQL/MariaDB (avec une base de données ESX)
- Serveur FiveM avec ESX

### Étape 1 : Cloner ou télécharger le projet

```bash
cd /home/user/full/fivem-banking-system
```

### Étape 2 : Installer les dépendances

```bash
npm install
```

### Étape 3 : Configuration

1. Copiez le fichier `.env.example` vers `.env` :
```bash
cp .env.example .env
```

2. Modifiez le fichier `.env` avec vos paramètres :

```env
# Configuration de la base de données
DB_HOST=127.0.0.1
DB_USER=root
DB_PASSWORD=votre_mot_de_passe
DB_NAME=zak
DB_PORT=3306

# Configuration du serveur
PORT=3000
NODE_ENV=production

# JWT Secret (IMPORTANT: Changez cette valeur!)
JWT_SECRET=votre_secret_jwt_tres_securise_et_aleatoire

# Session expiration (en heures)
SESSION_EXPIRATION=24
```

**⚠️ IMPORTANT : Changez absolument la valeur de `JWT_SECRET` par une valeur aléatoire et sécurisée !**

### Étape 4 : Démarrer le serveur

```bash
# Mode production
npm start

# Mode développement (avec auto-reload)
npm run dev
```

Le serveur sera accessible à l'adresse : `http://localhost:3000`

## 🔐 Authentification

### Comment les joueurs s'identifient ?

Le système utilise l'**identifier** du joueur (son identifiant unique dans la base de données ESX).

#### Pour se connecter :
1. Le joueur doit connaître son `identifier` (ex: `char0:fcb47b307801e586e8c95881bdfc98004f24d031`)
2. Il entre cet identifier dans le formulaire de connexion
3. Le système vérifie :
   - Si le joueur existe dans la base de données
   - Si son `job_grade` est >= 2 (patron/boss)
   - Si oui, il reçoit un token JWT valable 24h

#### Comment récupérer son identifier ?

Les joueurs peuvent récupérer leur identifier de plusieurs façons :

**Option 1 : Via un script FiveM**
Créez un script qui permet au joueur de voir son identifier en jeu :

```lua
-- Client-side
RegisterCommand('myid', function()
    TriggerServerEvent('banking:getMyIdentifier')
end, false)

-- Server-side
RegisterServerEvent('banking:getMyIdentifier')
AddEventHandler('banking:getMyIdentifier', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        TriggerClientEvent('chat:addMessage', source, {
            args = { 'Système', 'Votre identifier: ' .. xPlayer.identifier }
        })
    end
end)
```

**Option 2 : Via Discord/Website**
Ajoutez une page web qui permet aux joueurs de récupérer leur identifier après connexion Discord.

**Option 3 : Manuel**
Un admin peut récupérer l'identifier dans la base de données et le communiquer au joueur.

### Grades requis

Par défaut, seuls les joueurs avec `job_grade >= 2` peuvent accéder au système.

Vous pouvez modifier ce seuil dans `/middleware/auth.js` :

```javascript
// Ligne 25
if (req.user.job_grade < 2) {  // Changez 2 par le grade minimum souhaité
    return res.status(403).json({
        success: false,
        message: 'Accès refusé. Vous devez être patron d\'entreprise.'
    });
}
```

## 📊 Structure de la base de données

### Tables utilisées

Le système utilise les tables ESX standard :

1. **`users`** : Informations des joueurs
   - `identifier` : Identifiant unique
   - `firstname`, `lastname` : Nom du joueur
   - `job` : Métier
   - `job_grade` : Grade dans le métier

2. **`addon_account`** : Définition des comptes
   - `name` : Nom du compte (ex: `society_police`)
   - `label` : Libellé
   - `shared` : Type de compte

3. **`addon_account_data`** : Données des comptes
   - `account_name` : Nom du compte
   - `money` : Solde
   - `owner` : Propriétaire (NULL pour les entreprises)

4. **`p_bank_accounts`** : Comptes bancaires détaillés
   - `iban` : Numéro de compte
   - `owner` : Propriétaire
   - `name` : Nom du compte
   - `balance` : Solde
   - `type` : Type (personal/society)
   - `transactions` : Historique (JSON)
   - `logs` : Logs (JSON)

## 🎯 Utilisation

### Pour les patrons d'entreprise

1. **Se connecter**
   - Entrez votre identifier dans le formulaire
   - Cliquez sur "Se connecter"

2. **Vue d'ensemble**
   - Consultez le solde de l'entreprise
   - Voyez le nombre d'employés
   - Consultez les transactions récentes

3. **Gérer les employés**
   - Onglet "Employés"
   - Liste complète avec nom, prénom et grade
   - Bouton "Virement" pour chaque employé

4. **Effectuer un virement**
   - Onglet "Virement"
   - Sélectionnez l'employé
   - Entrez le montant
   - Ajoutez une description (optionnel)
   - Confirmez

5. **Consulter l'historique**
   - Onglet "Transactions"
   - Filtrez par type (revenus/dépenses)
   - Consultez tous les détails

## 🔒 Sécurité

### Mesures de sécurité implémentées

1. **JWT** : Tokens sécurisés avec expiration
2. **Rate limiting** : 100 requêtes max par 15 minutes
3. **Validation** : Toutes les entrées sont validées
4. **Transactions SQL** : Utilisation de transactions pour garantir l'intégrité
5. **Vérification des grades** : Middleware dédié
6. **Vérification des appartenances** : Un patron ne peut virer que dans SON entreprise
7. **CORS** : Configuration adaptable

### Recommandations

- ⚠️ Changez le `JWT_SECRET` dans le `.env`
- 🔐 Utilisez HTTPS en production
- 🛡️ Configurez un firewall
- 📝 Activez les logs
- 🔄 Sauvegardez régulièrement la base de données

## 📱 API Endpoints

### Authentication

#### POST `/api/auth/login`
Connexion d'un utilisateur

**Body:**
```json
{
  "identifier": "char0:xxx..."
}
```

**Response:**
```json
{
  "success": true,
  "message": "Connexion réussie",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIs...",
    "user": {
      "identifier": "char0:xxx...",
      "firstname": "John",
      "lastname": "Doe",
      "job": "police",
      "job_grade": 3
    }
  }
}
```

#### GET `/api/auth/verify`
Vérifier un token

**Headers:**
```
Authorization: Bearer <token>
```

### Banking

#### GET `/api/banking/society-account`
Récupérer les informations du compte de l'entreprise

**Headers:**
```
Authorization: Bearer <token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "society": "police",
    "balance": 150000,
    "transactions": [...],
    "logs": [...]
  }
}
```

#### GET `/api/banking/employees`
Liste des employés de l'entreprise

#### POST `/api/banking/transfer`
Effectuer un virement

**Body:**
```json
{
  "targetIdentifier": "char0:xxx...",
  "amount": 5000,
  "description": "Salaire du mois"
}
```

#### GET `/api/banking/transactions`
Historique des transactions (avec pagination)

**Query params:**
- `limit` : Nombre de résultats (défaut: 100)
- `offset` : Décalage (défaut: 0)

## 🐛 Dépannage

### Le serveur ne démarre pas

1. Vérifiez que MySQL est démarré
2. Vérifiez les identifiants dans `.env`
3. Vérifiez que le port 3000 n'est pas déjà utilisé

### Erreur de connexion à la base de données

```bash
# Testez la connexion MySQL
mysql -u root -p -h 127.0.0.1 zak
```

### "Token invalide ou expiré"

- Le token expire après 24h (configurable)
- Déconnectez-vous et reconnectez-vous

### "Accès refusé"

- Vérifiez que le `job_grade` du joueur est >= 2
- Vérifiez que le job correspond à une entreprise existante

## 🚀 Améliorations futures possibles

- [ ] Multi-langues (EN/FR)
- [ ] Système de notifications
- [ ] Export des transactions (PDF/Excel)
- [ ] Graphiques et statistiques
- [ ] Gestion des factures
- [ ] Système de primes automatiques
- [ ] Historique des modifications
- [ ] Système de permissions avancé
- [ ] API pour intégration FiveM directe

## 📄 Licence

MIT License - Libre d'utilisation et de modification

## 👨‍💻 Support

Pour toute question ou problème :
- Créez une issue sur GitHub
- Contactez le développeur

## 📝 Changelog

### Version 1.0.0 (2025-12-08)
- ✨ Version initiale
- 🔐 Système d'authentification JWT
- 💰 Gestion des comptes d'entreprise
- 👥 Gestion des employés
- 💸 Système de virements
- 📊 Historique des transactions
- 📱 Interface responsive

---

Développé avec ❤️ pour la communauté FiveM
