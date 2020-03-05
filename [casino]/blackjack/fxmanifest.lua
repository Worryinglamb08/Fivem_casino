fx_version 'adamant'
game 'gta5'

client_scripts {
	'shared.js',
	'client/blackjack.js',
	'client/client.js',
	'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    'client/html/script.js',
    'client/html/style.css'
})

--[[server_scripts {
	'shared.js',
	'server/server.js'
}]]--