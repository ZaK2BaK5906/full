fx_version 'cerulean'
game 'gta5'

author 'ZaK'
description 'Helper script pour le système de banque d\'entreprise'
version '1.0.0'

server_scripts {
    '@es_extended/locale.lua',
    'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'client/main.lua'
}

dependencies {
    'es_extended'
}
