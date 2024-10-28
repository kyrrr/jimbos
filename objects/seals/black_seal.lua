SMODS.Seal({
    name = "black_seal",
    key = "black_seal",
    badge_colour = HEX("1C1C1C"),
    config = {},
    loc_txt = {
        label = 'Black Seal',
        name = 'Black Seal',
        text = {
            "Destroy this card",
            "after it is scored"
        }
    },
    loc_vars = function(self, info_queue)
        return { vars = {} }
    end,
    atlas = "seals",
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        if context.cardarea == G.play and not card.dogmod_blackseal_calculated then
            card.dogmod_blackseal_calculated = true
            local destroyed_cards = {}
            local delayDissolve = 0.2
            if context.repetition then
                delayDissolve = 0.6
            end
            destroyed_cards[#destroyed_cards + 1] = card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = delayDissolve,
                func = function()
                    for i = #destroyed_cards, 1, -1 do
                        local _card = destroyed_cards[i]
                        if _card.ability.name == 'Glass Card' then
                            _card:shatter()
                        else
                            --delay(delayDissolve)
                            _card:start_dissolve(nil, i == #destroyed_cards)
                        end
                    end
                    return true
                end
            }))

            for i = 1, #G.jokers.cards do
                G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
            end
        end
    end,
})
