fx_version 'bodacious'
games { 'gta5' }

author 'Isigar'
version '1.2.1'

client_scripts {
    'client/native/*.lua',
    'client/test/*.lua', --Run specifics tests
}

server_scripts {

}

shared_scripts {
    'config.lua',
    'shared/*.lua',
}