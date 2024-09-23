return {
    versionCheck = true,
    lockdown = {
        enabled = true,

        -- true: Kick all players during lockdown, false: Keep whitelisted players
        kickAllPlayers = true,

        from = { -- Time when the server closes (24-hour format)
            hour = 3,
            minute = 15
        },

        to = { -- Time when the server opens (24-hour format)
            hour = 17,
            minute = 30,
        }
    },

    -- List of whitelisted player identifiers has to follow the following templates.
    allowedIdentifiers = {
        -- 'license:a84c129fbad317b8d5f6c7e18f0248abc9d5e13f'   -- Example license identifier
        -- 'discord:294990611633799180'                         -- Example discord identifier
    },

    -- Optional Discord role check for semi-whitelist servers (thanks @Maximus7474!)
    discord = {
        -- Discord Bot Token: https://discord.com/developers/applications
        -- Set to false to disable the Discord role check feature
        token = false,

        -- Guild Identifier
        guildId = '',

        -- List of allowed role identifiers
        allowedRoles = {
            -- '892853647950618675'                             -- Example role identifier
        }
    }
}
