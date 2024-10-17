function create_tarot(joker, seed)
    -- Check consumeable space
    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        -- Add card
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            trigger = "before",
            delay = 0.0,
            func = (function()
                local card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, nil, seed)
                card:add_to_deck()
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                return true
            end)
        }))
        -- Show message
        card_eval_status_text(joker, "extra", nil, nil, nil, {
            message = localize("k_plus_tarot"),
            colour = G.C.PURPLE
        })
    else
        card_eval_status_text(joker, "extra", nil, nil, nil, {
            message = localize("k_no_space_ex")
        })
    end
  end