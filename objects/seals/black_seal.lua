SMODS.Seal({
    name = "black_seal",
    key = "black_seal",
    badge_colour = HEX("000000"),
	config = { },
    loc_txt = {
        label = 'Black Seal',
        name = 'Black Seal',
        text = {
            "Destroy this card",
            "after it is scored"
        }
    },
    loc_vars = function(self, info_queue)
        return { vars = { } }
    end,
    atlas = "seals",
    pos = {x=0, y=0},
    calculate = function(self, card, context)
        local destroyed_cards = {}
        if context.cardarea == G.play and not card.dogmod_blackseal_calculated then
            destroyed_cards[#destroyed_cards+1] = card
            --table.insert(destroyed_cards, card)
            card.dogmod_blackseal_calculated = true
        elseif not context.repetition and card.dogmod_blackseal_calculated then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                        card:start_dissolve(nil, true)
                        return true
                    end
                }))
            delay(0.3)
            for i = 1, #G.jokers.cards do 
                G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
            end
        end
    end,
})
