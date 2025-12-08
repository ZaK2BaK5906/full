ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Commande pour récupérer son identifier
RegisterCommand('myid', function()
    TriggerServerEvent('banking:getMyIdentifier')
end, false)

-- Commande pour ouvrir la banque d'entreprise (ouvre dans le navigateur)
RegisterCommand('entreprisebank', function()
    local playerData = ESX.GetPlayerData()

    if playerData.job and playerData.job.grade >= 2 then
        TriggerServerEvent('banking:openWebsite')
    else
        ESX.ShowNotification('~r~Vous devez être patron pour accéder à la banque d\'entreprise')
    end
end, false)

-- Afficher l'identifier dans le chat
RegisterNetEvent('banking:showIdentifier')
AddEventHandler('banking:showIdentifier', function(identifier)
    TriggerEvent('chat:addMessage', {
        color = { 0, 255, 0 },
        multiline = true,
        args = { 'Système', 'Votre identifier: ' .. identifier .. '\nUtilisez cet identifiant pour vous connecter sur le site de la banque d\'entreprise.' }
    })
end)

-- Notification pour ouvrir le site
RegisterNetEvent('banking:openWebsiteNotification')
AddEventHandler('banking:openWebsiteNotification', function(url, identifier)
    TriggerEvent('chat:addMessage', {
        color = { 0, 150, 255 },
        multiline = true,
        args = {
            'Banque d\'Entreprise',
            'Ouvrez votre navigateur et accédez à: ' .. url .. '\n' ..
            'Votre identifier: ' .. identifier
        }
    })
end)

-- Aide
TriggerEvent('chat:addSuggestion', '/myid', 'Affiche votre identifiant pour la banque d\'entreprise')
TriggerEvent('chat:addSuggestion', '/entreprisebank', 'Ouvre la banque d\'entreprise (patrons uniquement)')
