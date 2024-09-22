return {
    lockdown = {
        enabled = true,

        from = { -- Time when the server closes (24-hour format)
            hour = 3,
            minute = 16
        },

        to = { -- Time when the server opens (24-hour format)
            hour = 17,
            minute = 0,
        }
    },

    -- List of whitelisted player identifiers has to follow the following templates.
    allowedIdentifiers = {
        -- 'license:a84c129fbad317b8d5f6c7e18f0248abc9d5e13f'   -- Example license identifier
        -- 'discord:728153984225673519'                         -- Example discord identifier
    },

    discord = {
        --[[ Discord Bot Token: https://discord.com/developers/applications ]]
        --[[ string or false ]]
        token = false,

        --[[ Guild Identifier ]]
        guildId = '',

        --[[ Guild Role Identifiers ]]
        allowedRoles = {
            ''
        }
    }
}
