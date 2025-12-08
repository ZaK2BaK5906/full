# 📦 Guide d'Installation Rapide

## ✅ Étape 1 : Vérifier les prérequis

Assurez-vous d'avoir installé :
- ✓ Node.js (v14+) - [Télécharger](https://nodejs.org/)
- ✓ MySQL/MariaDB - [Télécharger](https://dev.mysql.com/downloads/)
- ✓ Serveur FiveM avec ESX

## 🚀 Étape 2 : Installation

### 2.1 Installer les dépendances Node.js

```bash
cd /home/user/full/fivem-banking-system
npm install
```

### 2.2 Configuration de la base de données

1. Créez le fichier `.env` :

```bash
cp .env.example .env
```

2. Éditez `.env` et remplissez vos informations :

```env
DB_HOST=127.0.0.1
DB_USER=root
DB_PASSWORD=votre_mot_de_passe
DB_NAME=zak
DB_PORT=3306

PORT=3000
NODE_ENV=production

JWT_SECRET=CHANGEZ_CETTE_VALEUR_PAR_QUELQUE_CHOSE_DE_TRES_SECURISE
SESSION_EXPIRATION=24
```

**⚠️ IMPORTANT : Changez le `JWT_SECRET` !**

Pour générer un secret sécurisé :
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

## 🎮 Étape 3 : Installation du script FiveM (OPTIONNEL)

Si vous voulez que les joueurs puissent récupérer leur identifier en jeu :

1. Copiez le dossier `fivem-script/banking_helper` dans votre dossier `resources`

```bash
cp -r fivem-script/banking_helper /chemin/vers/votre/serveur/resources/
```

2. Ajoutez dans votre `server.cfg` :

```cfg
ensure banking_helper
```

3. Redémarrez votre serveur FiveM

### Commandes disponibles en jeu :
- `/myid` - Affiche votre identifier
- `/entreprisebank` - Affiche l'URL du site (patrons uniquement)
- `/getplayerid [id]` - (Admin) Récupère l'identifier d'un joueur

## ▶️ Étape 4 : Démarrer le serveur

```bash
# Mode production
npm start

# OU mode développement (avec auto-reload)
npm run dev
```

Le serveur sera accessible à : **http://localhost:3000**

## 🔒 Étape 5 : Premier test

### 5.1 Récupérer un identifier de test

Vous pouvez récupérer un identifier depuis votre base de données :

```sql
SELECT identifier, firstname, lastname, job, job_grade
FROM users
WHERE job_grade >= 2
LIMIT 1;
```

### 5.2 Se connecter

1. Ouvrez http://localhost:3000 dans votre navigateur
2. Entrez l'identifier récupéré
3. Cliquez sur "Se connecter"

✅ Vous devriez voir le dashboard !

## 🌐 Étape 6 : Rendre le site accessible depuis l'extérieur (OPTIONNEL)

### Option 1 : Nginx (Recommandé pour production)

Installez Nginx :

```bash
sudo apt install nginx
```

Créez un fichier de configuration :

```bash
sudo nano /etc/nginx/sites-available/banking
```

Contenu :

```nginx
server {
    listen 80;
    server_name votre-domaine.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

Activez le site :

```bash
sudo ln -s /etc/nginx/sites-available/banking /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

### Option 2 : Tunnel (Pour test uniquement)

Utilisez [ngrok](https://ngrok.com/) :

```bash
ngrok http 3000
```

## 🔧 Dépannage

### Problème : "Cannot connect to database"

**Solution :**
1. Vérifiez que MySQL est démarré :
   ```bash
   sudo systemctl status mysql
   ```

2. Testez la connexion :
   ```bash
   mysql -u root -p -h 127.0.0.1
   ```

3. Vérifiez les identifiants dans `.env`

### Problème : "Port 3000 already in use"

**Solution :**
1. Changez le port dans `.env` :
   ```env
   PORT=3001
   ```

2. OU arrêtez le processus utilisant le port :
   ```bash
   lsof -ti:3000 | xargs kill
   ```

### Problème : "JWT_SECRET not defined"

**Solution :**
Vérifiez que le fichier `.env` existe et contient `JWT_SECRET`

### Problème : "Accès refusé"

**Solutions :**
1. Vérifiez que le `job_grade` est >= 2
2. Vérifiez que le job existe dans `addon_account`

## 📊 Vérification de la structure de la base de données

Si vous avez des erreurs, vérifiez que toutes les tables existent :

```sql
SHOW TABLES LIKE 'users';
SHOW TABLES LIKE 'addon_account';
SHOW TABLES LIKE 'addon_account_data';
SHOW TABLES LIKE 'p_bank_accounts';
```

Si `p_bank_accounts` n'existe pas, créez-la :

```sql
CREATE TABLE IF NOT EXISTS p_bank_accounts (
    iban varchar(40) NOT NULL,
    owner varchar(60) DEFAULT NULL,
    name varchar(60) NOT NULL,
    balance int(11) NOT NULL DEFAULT 0,
    type varchar(10) NOT NULL,
    credit_score int(11) NOT NULL DEFAULT 0,
    users longtext NOT NULL DEFAULT '[]',
    invoices longtext NOT NULL DEFAULT '[]',
    transactions longtext NOT NULL DEFAULT '[]',
    logs longtext NOT NULL DEFAULT '[]',
    PRIMARY KEY (iban)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
```

## 🎉 Félicitations !

Votre système de banque d'entreprise est maintenant installé et fonctionnel !

## 📞 Support

En cas de problème :
1. Vérifiez les logs du serveur
2. Vérifiez la console du navigateur (F12)
3. Consultez le README.md pour plus de détails
4. Créez une issue sur GitHub

---

**Prochaines étapes :**
- Sécurisez votre installation (HTTPS, firewall)
- Configurez les sauvegardes automatiques
- Personnalisez l'interface selon vos besoins
