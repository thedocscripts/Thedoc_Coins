fx_version 'cerulean'
games { 'gta5' }
author 'Thedoc'

client_scripts {
    'client/**'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/**'
}