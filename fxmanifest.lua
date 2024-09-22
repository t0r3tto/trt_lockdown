fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

name 'trt_lockdown'
author 't0r3tto'
description 'Automatically lock & open server at fixed times'
repository 'https://github.com/t0r3tto/trt_lockdown'
version '1.0.0'

shared_script '@ox_lib/init.lua'

server_script 'server/main.lua'

files {
    'config/server.lua',
	'locales/*.json',
}

ox_libs {
	'cron',
	'locale',
	'table'
}