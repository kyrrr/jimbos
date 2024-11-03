local name = 'trousers'
SMODS.Joker:take_ownership(name, {
    loc_vars = function (self, info_queue, card)
        return {
            key = "j_dogmod_" .. name .. "_t" .. card.ability.extra.tier,
            vars = {
                card.ability.extra.extra, 
                localize('Two Pair', 'poker_hands'),
                card.ability.extra.mult,
                card.ability.extra.x_mult
            }
        }
    end,
})
