fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Code&Unity | https://discord.gg/Rkc2VmWEDz'
description 'CodeUnity Buy Illegal Items'
version '1.0'

lua54 'yes'

shared_scripts {
    '@es_extended/imports.lua',
    'Shared/*.lua'
}
client_scripts {
    'Client/functions.lua',
    'Client/*.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'Server/*.lua'
}
