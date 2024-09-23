# trt_lockdown

The resource allows you to manage server access based on specified time intervals. During the lockdown period, players who are not whitelisted will be unable to connect to the server. This is useful for maintaining control over player access during specific hours.

## Features

- Automatically closes the server during designated hours.
- Allows whitelisted players to connect during lockdown.

## Dependency

### [ox_lib](https://github.com/overextended/ox_lib)

This library is used for cron job scheduling, enabling the automatic opening and closing of the server based on time.

## Configuration

The lockdown configuration can be found in the `config/server` file:

```lua
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
```

## Permissions

To allow certain players to bypass the lockdown, you can set the following permissions in your server's configuration:

```
add_ace identifier.discord:xxx lockdown.bypass allow
add_ace group.mod lockdown.bypass allow
```

Replace identifier.discord:xxx with the appropriate Discord identifier for the player.

## Installation

1. Download the trt_lockdown script.
2. Place it in your server's resource directory.
3. Add start trt_lockdown to your server.cfg.
4. Configure the config.server file according to your needs.

## Usage

Once configured, the script will automatically manage server access based on the specified times in the configuration. Players attempting to connect during the lockdown period will receive a rejection message unless they are whitelisted.
