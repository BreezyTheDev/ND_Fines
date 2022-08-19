# ND_Fines

## What is it?

This resource was made for [ND_Framework](https://github.com/Andyyy7666/ND_Framework). This allows LEO to fine Civilians for their charges. This script is fully chat-based, if you have any knowledge in html or css or anything of that nature feel free to fork this and remake with that side of coding. 

## Commands

`/fine <id> <amount> <reason>` - This command will deduct money from the targeted player for the desired amount entered. - Requires `NDFines.leo` Ace permission.

## Required Dependencies

[ND_Framework](https://github.com/Andyyy7666/ND_Framework)

## Configuration

The following can be found in the ``config.lua`` file.
```
    Prefix = "^3[^1Police^3] ",
    Fine = {
        Toggle = true,
        Command = "fine", 
        MaxValue = 1001,  MaxText = "$1000." -- Sets the maxium amount an officer can fine for.
    },
    DiscordLogs = {
        Toggle = false,
        Webhook = ''
    },
    Debug = {
        Toggle = false
    },
```
You can toggle the command on or off, change the commands to your preference & set the maximun amount a player can be fined for.

## Download
https://github.com/BreezyTheDev/ND_Fines

## Errors or Suggestions?
Please message me on discord if you come across any errors when using this resource or if you would like to make a suggestion.
Discord: `Breezy#0001`


