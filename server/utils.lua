local Utils = {}
local config = require 'config.server'

local function IsDiscordWhitelisted(source)
    if type(config.discord.token) ~= 'string' or #config.discord.token < 60 then return false end

    local discordId
    for _, identifier in pairs(GetPlayerIdentifiers(source)) do
        if string.match(identifier, "^discord:") then
            discordId = string.sub(identifier, 9)
            break
        end
    end

    if not discordId then return false end

    local hasRole = promise.new()
    PerformHttpRequest(('https://discord.com/api/v8/guilds/%s/members/%s'):format(config.discord.guildId, discordId), function(err, data, headers)
        if data then 
            local discordData = json.decode(data)

            for _,role in pairs(discordData.roles) do
                if lib.table.contains(config.discord.allowedRoles, role) then
                    hasRole:resolve(true)
                    return
                end
            end

            hasRole:resolve(false)
        else
            hasRole:resolve(false)
        end
    end, 'GET', '', { ['Content-Type'] = 'application/json', ['Authorization'] = ('Bot %s'):format(config.discord.token) })

    return Citizen.Await(hasRole)
end

local function IsIdentifierWhitelisted(source)
    for _, identifier in pairs(GetPlayerIdentifiers(source)) do
        if lib.table.contains(config.allowedIdentifiers, identifier) then
            return true
        end
    end
    return false
end

function Utils.IsWhitelisted(source)
    return (
        IsIdentifierWhitelisted(source) or
        IsPlayerAceAllowed(source, 'lockdown.bypass') or
        IsDiscordWhitelisted(source)
    )
end

return Utils