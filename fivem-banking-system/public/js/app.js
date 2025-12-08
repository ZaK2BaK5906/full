// Configuration de l'API
const API_URL = 'http://localhost:3000/api';

// État global de l'application
const state = {
    token: localStorage.getItem('token') || null,
    user: null,
    society: null,
    employees: [],
    transactions: [],
    balance: 0
};

// Utility functions
function formatCurrency(amount) {
    return new Intl.NumberFormat('fr-FR', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    }).format(amount).replace('$US', '$');
}

function formatDate(timestamp) {
    const date = new Date(timestamp * 1000);
    return date.toLocaleString('fr-FR', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
}

function showPage(pageId) {
    document.querySelectorAll('.page').forEach(page => {
        page.classList.remove('active');
    });
    document.getElementById(pageId).classList.add('active');
}

function showTab(tabId) {
    document.querySelectorAll('.tab-content').forEach(tab => {
        tab.classList.remove('active');
    });
    document.querySelectorAll('.tab-btn').forEach(btn => {
        btn.classList.remove('active');
    });

    document.getElementById(tabId + 'Tab').classList.add('active');
    document.querySelector(`[data-tab="${tabId}"]`).classList.add('active');
}

function showError(elementId, message) {
    const element = document.getElementById(elementId);
    element.textContent = message;
    element.style.display = 'block';
    setTimeout(() => {
        element.style.display = 'none';
    }, 5000);
}

function showSuccess(elementId, message) {
    const element = document.getElementById(elementId);
    element.textContent = message;
    element.style.display = 'block';
    setTimeout(() => {
        element.style.display = 'none';
    }, 5000);
}

// API calls
async function apiCall(endpoint, method = 'GET', body = null) {
    const options = {
        method,
        headers: {
            'Content-Type': 'application/json'
        }
    };

    if (state.token) {
        options.headers['Authorization'] = `Bearer ${state.token}`;
    }

    if (body) {
        options.body = JSON.stringify(body);
    }

    const response = await fetch(`${API_URL}${endpoint}`, options);
    const data = await response.json();

    if (!response.ok) {
        throw new Error(data.message || 'Une erreur est survenue');
    }

    return data;
}

// Authentication
async function login(identifier) {
    try {
        const data = await apiCall('/auth/login', 'POST', { identifier });

        if (data.success) {
            state.token = data.data.token;
            state.user = data.data.user;
            localStorage.setItem('token', state.token);
            localStorage.setItem('user', JSON.stringify(state.user));

            showPage('dashboardPage');
            await loadDashboard();
        }
    } catch (error) {
        showError('loginError', error.message);
    }
}

function logout() {
    state.token = null;
    state.user = null;
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    showPage('loginPage');
}

// Dashboard functions
async function loadDashboard() {
    try {
        // Mettre à jour les informations de l'utilisateur dans le header
        document.getElementById('userName').textContent =
            `${state.user.firstname} ${state.user.lastname}`;
        document.getElementById('societyName').textContent =
            `Entreprise: ${state.user.job}`;

        // Charger les données
        await Promise.all([
            loadSocietyAccount(),
            loadEmployees(),
            loadTransactions()
        ]);

        updateOverview();
    } catch (error) {
        console.error('Erreur lors du chargement du dashboard:', error);
    }
}

async function loadSocietyAccount() {
    try {
        const data = await apiCall('/banking/society-account');
        if (data.success) {
            state.society = data.data;
            state.balance = data.data.balance;
            state.transactions = data.data.transactions;

            document.getElementById('societyBalance').textContent =
                formatCurrency(state.balance);
        }
    } catch (error) {
        console.error('Erreur lors du chargement du compte:', error);
    }
}

async function loadEmployees() {
    try {
        const data = await apiCall('/banking/employees');
        if (data.success) {
            state.employees = data.data;
            displayEmployees();
            updateEmployeeSelect();
        }
    } catch (error) {
        console.error('Erreur lors du chargement des employés:', error);
    }
}

async function loadTransactions() {
    try {
        const data = await apiCall('/banking/transactions?limit=100');
        if (data.success) {
            state.transactions = data.data.transactions;
            displayTransactions();
        }
    } catch (error) {
        console.error('Erreur lors du chargement des transactions:', error);
    }
}

function updateOverview() {
    // Mettre à jour le nombre d'employés
    document.getElementById('employeeCount').textContent = state.employees.length;

    // Calculer les transactions du mois
    const now = new Date();
    const firstDayOfMonth = new Date(now.getFullYear(), now.getMonth(), 1).getTime() / 1000;
    const monthTransactions = state.transactions.filter(t => t.date >= firstDayOfMonth);
    document.getElementById('monthTransactions').textContent = monthTransactions.length;

    // Afficher les transactions récentes
    displayRecentTransactions();
}

function displayRecentTransactions() {
    const container = document.getElementById('recentTransactions');
    const recentTransactions = state.transactions.slice(0, 5);

    if (recentTransactions.length === 0) {
        container.innerHTML = `
            <div class="empty-state">
                <div class="empty-state-icon">📭</div>
                <p>Aucune transaction récente</p>
            </div>
        `;
        return;
    }

    container.innerHTML = recentTransactions.map(transaction => `
        <div class="transaction-item ${transaction.type}">
            <div class="transaction-info">
                <div class="transaction-title">${transaction.title || 'Transaction'}</div>
                <div class="transaction-details">
                    ${transaction.type === 'income' ? 'De' : 'À'}: ${transaction.type === 'income' ? transaction.from : transaction.to}
                    <br>
                    <small>${formatDate(transaction.date)}</small>
                </div>
            </div>
            <div class="transaction-amount ${transaction.type === 'income' ? 'positive' : 'negative'}">
                ${transaction.type === 'income' ? '+' : '-'}${formatCurrency(transaction.amount)}
            </div>
        </div>
    `).join('');
}

function displayEmployees() {
    const tbody = document.getElementById('employeesTableBody');

    if (state.employees.length === 0) {
        tbody.innerHTML = `
            <tr>
                <td colspan="4" style="text-align: center; padding: 40px;">
                    <div class="empty-state">
                        <div class="empty-state-icon">👥</div>
                        <p>Aucun employé trouvé</p>
                    </div>
                </td>
            </tr>
        `;
        return;
    }

    tbody.innerHTML = state.employees.map(employee => `
        <tr>
            <td>${employee.lastname || 'N/A'}</td>
            <td>${employee.firstname || 'N/A'}</td>
            <td>Grade ${employee.job_grade}</td>
            <td>
                <button class="btn btn-primary" onclick="quickTransfer('${employee.identifier}', '${employee.firstname} ${employee.lastname}')">
                    Virement
                </button>
            </td>
        </tr>
    `).join('');
}

function updateEmployeeSelect() {
    const select = document.getElementById('targetEmployee');
    select.innerHTML = '<option value="">Sélectionnez un employé</option>' +
        state.employees.map(employee => `
            <option value="${employee.identifier}">
                ${employee.firstname} ${employee.lastname} (Grade ${employee.job_grade})
            </option>
        `).join('');
}

function displayTransactions() {
    const container = document.getElementById('transactionsList');
    const filter = document.getElementById('transactionFilter')?.value || 'all';

    let filteredTransactions = state.transactions;
    if (filter !== 'all') {
        filteredTransactions = state.transactions.filter(t => t.type === filter);
    }

    if (filteredTransactions.length === 0) {
        container.innerHTML = `
            <div class="empty-state">
                <div class="empty-state-icon">📭</div>
                <p>Aucune transaction trouvée</p>
            </div>
        `;
        return;
    }

    container.innerHTML = filteredTransactions.map(transaction => `
        <div class="transaction-item ${transaction.type}">
            <div class="transaction-info">
                <div class="transaction-title">${transaction.title || 'Transaction'}</div>
                <div class="transaction-details">
                    ${transaction.type === 'income' ? 'De' : 'À'}: ${transaction.type === 'income' ? transaction.from : transaction.to}
                    <br>
                    <small>ID: ${transaction.id} | ${formatDate(transaction.date)}</small>
                </div>
            </div>
            <div class="transaction-amount ${transaction.type === 'income' ? 'positive' : 'negative'}">
                ${transaction.type === 'income' ? '+' : '-'}${formatCurrency(transaction.amount)}
            </div>
        </div>
    `).join('');
}

function quickTransfer(identifier, name) {
    showTab('transfer');
    document.getElementById('targetEmployee').value = identifier;
}

async function handleTransfer(event) {
    event.preventDefault();

    const targetIdentifier = document.getElementById('targetEmployee').value;
    const amount = parseInt(document.getElementById('amount').value);
    const description = document.getElementById('description').value || 'Virement entreprise';

    if (!targetIdentifier || !amount || amount <= 0) {
        showError('transferError', 'Veuillez remplir tous les champs correctement');
        return;
    }

    if (amount > state.balance) {
        showError('transferError', 'Solde insuffisant dans le compte de l\'entreprise');
        return;
    }

    try {
        const data = await apiCall('/banking/transfer', 'POST', {
            targetIdentifier,
            amount,
            description
        });

        if (data.success) {
            showSuccess('transferSuccess', data.message);
            document.getElementById('transferForm').reset();

            // Recharger les données
            await loadDashboard();
        }
    } catch (error) {
        showError('transferError', error.message);
    }
}

// Event listeners
document.addEventListener('DOMContentLoaded', () => {
    // Vérifier si l'utilisateur est déjà connecté
    if (state.token) {
        const savedUser = localStorage.getItem('user');
        if (savedUser) {
            state.user = JSON.parse(savedUser);
            showPage('dashboardPage');
            loadDashboard();
        } else {
            logout();
        }
    }

    // Login form
    document.getElementById('loginForm').addEventListener('submit', (e) => {
        e.preventDefault();
        const identifier = document.getElementById('identifier').value;
        login(identifier);
    });

    // Logout button
    document.getElementById('logoutBtn').addEventListener('click', logout);

    // Tab navigation
    document.querySelectorAll('.tab-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            const tab = btn.getAttribute('data-tab');
            showTab(tab);
        });
    });

    // Transfer form
    document.getElementById('transferForm').addEventListener('submit', handleTransfer);

    // Transaction filter
    document.getElementById('transactionFilter')?.addEventListener('change', displayTransactions);
});
