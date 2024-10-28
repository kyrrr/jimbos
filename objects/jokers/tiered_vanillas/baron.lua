SMODS.Joker:take_ownership('baron', {
    loc_vars = function (self, info_queue, card)
        return {key = "j_dogmod_baron_t" .. card.ability.extra.tier, vars = {card.ability.extra.multmult}}
    end,
})
