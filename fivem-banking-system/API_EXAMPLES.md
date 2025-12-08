# 📡 Exemples d'utilisation de l'API

Ce document contient des exemples de requêtes pour tester l'API du système de banque d'entreprise.

## 🔐 Authentication

### Login

**Requête :**
```bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "identifier": "char0:fcb47b307801e586e8c95881bdfc98004f24d031"
  }'
```

**Réponse (succès) :**
```json
{
  "success": true,
  "message": "Connexion réussie",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "user": {
      "identifier": "char0:fcb47b307801e586e8c95881bdfc98004f24d031",
      "firstname": "Zak",
      "lastname": "Dev",
      "job": "pops",
      "job_grade": 1
    }
  }
}
```

**Réponse (erreur - grade insuffisant) :**
```json
{
  "success": false,
  "message": "Accès refusé. Vous devez être patron d'entreprise (grade minimum: 2)"
}
```

### Vérifier un token

**Requête :**
```bash
curl -X GET http://localhost:3000/api/auth/verify \
  -H "Authorization: Bearer VOTRE_TOKEN_ICI"
```

**Réponse :**
```json
{
  "success": true,
  "user": {
    "identifier": "char0:fcb47b307801e586e8c95881bdfc98004f24d031",
    "firstname": "Zak",
    "lastname": "Dev",
    "job": "pops",
    "job_grade": 1,
    "iat": 1701234567,
    "exp": 1701320967
  }
}
```

## 💰 Banking Operations

### Récupérer les informations du compte de l'entreprise

**Requête :**
```bash
curl -X GET http://localhost:3000/api/banking/society-account \
  -H "Authorization: Bearer VOTRE_TOKEN_ICI"
```

**Réponse :**
```json
{
  "success": true,
  "data": {
    "society": "pops",
    "balance": 150000,
    "transactions": [
      {
        "id": 1,
        "type": "income",
        "from": "SYSTEM",
        "to": "Pop's Diner",
        "title": "Vente",
        "amount": 5000,
        "date": 1701234567
      }
    ],
    "logs": []
  }
}
```

### Récupérer la liste des employés

**Requête :**
```bash
curl -X GET http://localhost:3000/api/banking/employees \
  -H "Authorization: Bearer VOTRE_TOKEN_ICI"
```

**Réponse :**
```json
{
  "success": true,
  "data": [
    {
      "identifier": "char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6",
      "firstname": "Y",
      "lastname": "Dv",
      "job_grade": 0
    },
    {
      "identifier": "char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7",
      "firstname": "Karl",
      "lastname": "Miller",
      "job_grade": 0
    }
  ]
}
```

### Effectuer un virement

**Requête :**
```bash
curl -X POST http://localhost:3000/api/banking/transfer \
  -H "Authorization: Bearer VOTRE_TOKEN_ICI" \
  -H "Content-Type: application/json" \
  -d '{
    "targetIdentifier": "char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6",
    "amount": 5000,
    "description": "Salaire du mois"
  }'
```

**Réponse (succès) :**
```json
{
  "success": true,
  "message": "Virement de 5000$ effectué avec succès à Y Dv"
}
```

**Réponse (erreur - solde insuffisant) :**
```json
{
  "success": false,
  "message": "Solde insuffisant dans le compte de l'entreprise"
}
```

**Réponse (erreur - employé non trouvé) :**
```json
{
  "success": false,
  "message": "Employé non trouvé"
}
```

**Réponse (erreur - pas de la même entreprise) :**
```json
{
  "success": false,
  "message": "Cet employé ne fait pas partie de votre entreprise"
}
```

### Récupérer l'historique des transactions

**Requête :**
```bash
curl -X GET "http://localhost:3000/api/banking/transactions?limit=50&offset=0" \
  -H "Authorization: Bearer VOTRE_TOKEN_ICI"
```

**Réponse :**
```json
{
  "success": true,
  "data": {
    "transactions": [
      {
        "id": 5,
        "type": "outcome",
        "from": "Pop's Diner",
        "to": "Y Dv",
        "title": "Salaire du mois",
        "amount": 5000,
        "date": 1701234567
      },
      {
        "id": 4,
        "type": "income",
        "from": "SYSTEM",
        "to": "Pop's Diner",
        "title": "Vente",
        "amount": 2500,
        "date": 1701220000
      }
    ],
    "total": 45
  }
}
```

## 🔍 Test complet avec JavaScript

Voici un exemple de test complet en JavaScript :

```javascript
const API_URL = 'http://localhost:3000/api';

// 1. Login
async function login() {
  const response = await fetch(`${API_URL}/auth/login`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      identifier: 'char0:fcb47b307801e586e8c95881bdfc98004f24d031'
    })
  });

  const data = await response.json();

  if (data.success) {
    console.log('✅ Login réussi');
    return data.data.token;
  } else {
    console.error('❌ Login échoué:', data.message);
    return null;
  }
}

// 2. Récupérer le compte de l'entreprise
async function getSocietyAccount(token) {
  const response = await fetch(`${API_URL}/banking/society-account`, {
    headers: {
      'Authorization': `Bearer ${token}`
    }
  });

  const data = await response.json();

  if (data.success) {
    console.log('✅ Solde:', data.data.balance);
    return data.data;
  } else {
    console.error('❌ Erreur:', data.message);
    return null;
  }
}

// 3. Effectuer un virement
async function makeTransfer(token, targetIdentifier, amount) {
  const response = await fetch(`${API_URL}/banking/transfer`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      targetIdentifier,
      amount,
      description: 'Virement test'
    })
  });

  const data = await response.json();

  if (data.success) {
    console.log('✅ Virement réussi:', data.message);
    return true;
  } else {
    console.error('❌ Virement échoué:', data.message);
    return false;
  }
}

// Test complet
async function runTests() {
  console.log('🔄 Démarrage des tests...\n');

  // 1. Login
  const token = await login();
  if (!token) return;

  // 2. Récupérer le compte
  const account = await getSocietyAccount(token);
  if (!account) return;

  // 3. Effectuer un virement
  if (account.balance >= 1000) {
    await makeTransfer(token, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1000);
  } else {
    console.log('⚠️ Solde insuffisant pour faire un virement de test');
  }

  console.log('\n✅ Tests terminés');
}

// Exécuter les tests
runTests();
```

## 🧪 Test avec Postman

### 1. Créer une collection

1. Créez une nouvelle collection "FiveM Banking"
2. Créez une variable d'environnement `base_url` = `http://localhost:3000/api`
3. Créez une variable `token` (laissez vide pour l'instant)

### 2. Requête Login

- **Method:** POST
- **URL:** `{{base_url}}/auth/login`
- **Body (JSON):**
```json
{
  "identifier": "char0:fcb47b307801e586e8c95881bdfc98004f24d031"
}
```

- **Tests (pour enregistrer le token):**
```javascript
if (pm.response.code === 200) {
    var jsonData = pm.response.json();
    pm.environment.set("token", jsonData.data.token);
}
```

### 3. Requête Get Society Account

- **Method:** GET
- **URL:** `{{base_url}}/banking/society-account`
- **Headers:**
  - `Authorization`: `Bearer {{token}}`

### 4. Requête Transfer

- **Method:** POST
- **URL:** `{{base_url}}/banking/transfer`
- **Headers:**
  - `Authorization`: `Bearer {{token}}`
  - `Content-Type`: `application/json`
- **Body (JSON):**
```json
{
  "targetIdentifier": "char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6",
  "amount": 5000,
  "description": "Test de virement"
}
```

## 🔒 Codes d'erreur

| Code | Signification | Description |
|------|---------------|-------------|
| 200  | OK            | Requête réussie |
| 400  | Bad Request   | Données invalides |
| 401  | Unauthorized  | Token invalide ou expiré |
| 403  | Forbidden     | Accès refusé (grade insuffisant) |
| 404  | Not Found     | Ressource non trouvée |
| 500  | Server Error  | Erreur serveur |

## 📊 Headers requis

### Pour toutes les requêtes authentifiées :

```
Authorization: Bearer VOTRE_TOKEN_ICI
```

### Pour les requêtes POST/PUT :

```
Content-Type: application/json
```

---

**Note :** Remplacez `VOTRE_TOKEN_ICI` par le token obtenu lors du login.
