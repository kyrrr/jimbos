local name = 'bloodstone'
SMODS.Joker:take_ownership(name, {
    loc_vars = function (self, info_queue, card)
        return {key = "j_dogmod_bloodstone_t" .. card.ability.extra.tier, vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.Xmult}}
    end,
})
