fx_version 'cerulean'
game 'gta5'

author 'Scotty & Flatracer'
description 'Demolition Derby - A gamemode by Scotty & Flatracer'

resource_type 'gametype' { name = 'Demolition Derby' }

dependencies {
    'NativeUI',
}

client_script {
	'@NativeUI/NativeUI.lua',
	'Configuration.lua',
	'Peds.lua',
	'Vehicles.lua',
	'CLIENT/NetEvents.lua',
	'CLIENT/Global.lua',
	'CLIENT/AdminMenu.lua',
	'CLIENT/TimeAndWeather.lua',
	'CLIENT/MapSpawn.lua',
	'CLIENT/PlayerSpawn.lua',
	'CLIENT/MainThread.lua',
	'CLIENT/GamerTags.lua',
	'CLIENT/AFKandPingKick.lua',
	'CLIENT/PlayerList.lua',
	'CLIENT/Leaderboard.lua',
	'CLIENT/Voting.lua',
}

server_script {
	'Configuration.lua',
	'Vehicles.lua',
	'SERVER/General.lua',
	'SERVER/Global.lua',
	'SERVER/Commands.lua',
	'SERVER/SlotReserving.lua',
	'SERVER/MapToLua.lua',
	'SERVER/MapsManager.lua',
	'SERVER/ServerEvents.lua',
	'SERVER/AFKandPingKick.lua',
	'SERVER/Leaderboard.lua',
}

