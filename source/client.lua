--================================--
--      ND_Fines 1.0              --
--      by BreezyTheDev           --
--		GNU License v3.0		  --
--================================--

TriggerEvent('chat:addSuggestion', '/fine', 'Fine a player', {
    {
        name = "ID",
        help = "the ID of the player you wish to fine."
    },
    {
        name = "amount",
        help = "what is the amount you would like to fine for?"
    },
    {
        name = "reason",
        help = "what is the reason for the fine?"
    }
})