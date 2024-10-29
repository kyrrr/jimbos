SMODS.Joker({
  key = "fixed_odds",
  atlas = "jokers",
  pos = { x = 0, y = 0 },
  loc_txt = {
    name = "Fixed Odds",
    text = {
      "If all scored cards",
      "are {C:attention}Lucky{} cards,",
      "double the chance of each triggering",
    }
  },
  rarity = 2,
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  ability = { extra = { canRankUp = true, tier = 1, maxTier = 2, increaseOddsTimes = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { self.ability.extra.increaseOddsTimes } }
  end,
  calculate = function(self, card, context)
    if context.before and context.cardarea == G.jokers and not context.blueprint then
      local allAreLucky = true

      for _, scoringCard in ipairs(context.scoring_hand) do
        if scoringCard.ability.name ~= 'Lucky Card' or (scoringCard.ability.name == 'Lucky Card' and scoringCard.debuff) then
          allAreLucky = false
        end
      end

      if allAreLucky then
        card_eval_status_text(card, "extra", nil, nil, nil, {message = "More likely!"})
        allAreLucky = false
      end -- end all are lucky
    end   -- end if context
  end     -- end calculate
})
