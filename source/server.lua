--================================--
--      ND_Fines 1.0                --
--      by BreezyTheDev           --
--		GNU License v3.0		  --
--================================--

-- ND_Framework export.
NDCore = exports["ND_Core"]:GetCoreObject()

-- Commands
if Settings.Fine.Toggle then
    RegisterCommand(Settings.Fine.Command, function(source, args, rawCommand)
        if IsPlayerAceAllowed(source, "NDFines.leo") then
            local player = source
            local target = tonumber(args[1])
            local amount = tonumber(args[2])
            local reason = table.concat(args, " ", 3)
            local players = NDCore.Functions.GetPlayers()
            if target and amount ~= nil then
                if amount < Settings.Fine.MaxValue then
                    if reason ~= "" then
                        NDCore.Functions.DeductMoney(amount, target, "bank")
                        local playerCName = players[player].firstName .. ' ' .. players[player].lastName
                        local targetCName = players[target].firstName .. ' ' .. players[target].lastName
                        TriggerClientEvent('chatMessage', target, Settings.Prefix..' ^3You have been fined: ^5$'..amount..' ^3by ^5'..playerCName..' ^3for: ^1'..reason)
                        TriggerClientEvent('chatMessage', source, Settings.Prefix..' ^3You have sucessfully fined: ^5'..targetCName.. ' ^3for ^5$'..amount)
                        -- Discord Logs
                        if Settings.DiscordLogs.Toggle then
                            sendToDisc("PLAYER FINED", "Player **" .. GetPlayerName(target) .. "** has been fined $"..amount.. " by " .. "**".. GetPlayerName(player) .. "** for: "..reason);
                        end
                    else
                        TriggerClientEvent('chatMessage', source, '^1ERROR: You must include a reason for the fine.')
                        if Settings.DiscordLogs.Toggle then
                           sendToDisc("FINE REQUEST: Rejected", "Player **" .. GetPlayerName(source) .. "** attempted to give a fine over "..Settings.Fine.MaxText);
                        end
                    end
                else
                    TriggerClientEvent('chatMessage', source, '^1ERROR: You can only fine up to '..Settings.Fine.MaxText)
                end
            else
                -- Wrong syntax, it's /fine <id> <amount> <reason>
                TriggerClientEvent('chatMessage', source, '^1ERROR: Wrong usage. /fine <id> <amount> <reason>')
            end
        else
            TriggerClientEvent('chatMessage', source, '^1ERROR: You do not have permission to utilize this command.')
        end
    end, false)
end

-- Functions
function sendToDisc(title, msg)
    local embed = {}
    embed = {
        {
            ["color"] = 44270,
            ["title"] = "**".. title .."**",
            ["description"] = msg,
            ["footer"] = {
                ["text"] = "[ND_Fines]",
            },
        }
    }
    PerformHttpRequest(Settings.DiscordLogs.Webhook, 
    function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

-- Debug
if Settings.DiscordLogs.Toggle and Settings.Debug.Toggle then
    if Settings.DiscordLogs.Webhook == '' then
        print("^1[ND_Fines Debug] ^3In order for discord logs to work properly a webhook needs to be added in the config.")
    end
end
