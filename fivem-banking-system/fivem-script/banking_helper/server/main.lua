ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Configuration
local Config = {
    WebsiteURL = 'http://localhost:3000', -- Changez par l'URL de votre site
    MinGrade = 2 -- Grade minimum pour être patron
}

-- Récupérer l'identifier du joueur
RegisterServerEvent('banking:getMyIdentifier')
AddEventHandler('banking:getMyIdentifier', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        TriggerClientEvent('banking:showIdentifier', source, xPlayer.identifier)
    end
end)

-- Ouvrir le site web de la banque
RegisterServerEvent('banking:openWebsite')
AddEventHandler('banking:openWebsite', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        if xPlayer.job.grade >= Config.MinGrade then
            TriggerClientEvent('banking:openWebsiteNotification', source, Config.WebsiteURL, xPlayer.identifier)
        else
            TriggerClientEvent('esx:showNotification', source, '~r~Vous devez être patron (grade ' .. Config.MinGrade .. ' minimum)')
        end
    end
end)

-- Commande admin pour récupérer l'identifier d'un joueur
ESX.RegisterCommand('getplayerid', 'admin', function(xPlayer, args, showError)
    local targetId = args.playerId

    if targetId then
        local xTarget = ESX.GetPlayerFromId(targetId)

        if xTarget then
            TriggerClientEvent('chat:addMessage', xPlayer.source, {
                color = { 255, 165, 0 },
                multiline = true,
                args = {
                    'Admin',
                    'Identifier de ' .. xTarget.getName() .. ': ' .. xTarget.identifier
                }
            })
        else
            showError('Joueur non trouvé')
        end
    else
        showError('Utilisation: /getplayerid [id]')
    end
end, false, {
    help = 'Récupère l\'identifier d\'un joueur',
    validate = true,
    arguments = {
        { name = 'playerId', help = 'ID du joueur', type = 'number' }
    }
})

print('^2[Banking Helper]^7 Script chargé avec succès!')
print('^2[Banking Helper]^7 URL du site: ^3' .. Config.WebsiteURL)
print('^2[Banking Helper]^7 Grade minimum: ^3' .. Config.MinGrade)
