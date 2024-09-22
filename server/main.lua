local config = require 'config.server'
local utils = require 'server.utils'

if not config.lockdown.enabled then return end

local From, To = config.lockdown.from, config.lockdown.to

lib.cron.new(string.format('%d %d * * *', From.minute, From.hour), function()
    GlobalState.serverLockdown = true
end)

lib.cron.new(string.format('%d %d * * *', To.minute, To.hour), function()
    GlobalState.serverLockdown = false
end)

AddEventHandler('playerConnecting', function(name, _, deferrals)
    local source = source

    deferrals.defer()
    Wait(0)

    CreateThread(function()
        deferrals.update(locale('checking_lockdown', name))

        if not GlobalState.serverLockdown then
            return deferrals.done()
        end

        local isWhitelisted = utils.IsWhitelisted(source)

        Wait(0)
        if isWhitelisted then
            deferrals.done()
        else
            deferrals.done(locale('reject_message', To.hour, To.minute, From.hour, From.minute))
        end
    end)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        local hour, minute = tonumber(os.date("%H")), tonumber(os.date("%M"))

        GlobalState.serverLockdown =
            (hour > From.hour or (hour == From.hour and minute >= From.minute)) and
            (hour < To.hour or (hour == To.hour and minute < To.minute))
    end
end)

AddStateBagChangeHandler('serverLockdown', 'global', function(_, _, value)
    if value then
        lib.print.info("Closing the server..")

        for _, playerId in ipairs(GetPlayers()) do
            local isWhitelisted = utils.IsWhitelisted(playerId)

            if not isWhitelisted or config.lockdown.kickAllPlayers then
                DropPlayer(playerId, locale('kick_message', To.hour, To.minute))
            end
        end
    else
        lib.print.info("Opening the server..")
    end
end)