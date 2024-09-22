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

    -- List of whitelisted player identifiers (license or license2).
    allowedIdentifiers = {
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
