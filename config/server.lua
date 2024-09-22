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
        -- 'license:999a406ddec315d7c9e4b5f16e230f9ace6e09c6' -- Example license identifier
    },
}
