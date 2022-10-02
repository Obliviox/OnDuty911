fx_version 'cerulean'
game 'gta5'

author 'JaredScar / Obliviox Edit'
description 'PoliceEMSActivity / OnDuty911 Integration'
version '2.0'
url 'https://github.com/JaredScar/PoliceEMSActivity'

client_scripts {
	'client.lua',
    'EmergencyBlips/cl_emergencyblips.lua',
}

server_scripts {
	'config.lua',
	"server.lua",
    'EmergencyBlips/sv_emergencyblips.lua',
}

server_exports {
	"isOnDuty"
 }