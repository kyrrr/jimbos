SMODS.Joker({
	key = "fixed_odds",
	atlas = "jokers",
	pos = {x = 0, y = 0},
    loc_txt = {
      name = "Fixed Odds",
      text = { --G.GAME.probabilities.normal
        "If all scored cards",
        "are {C:attention}Lucky{} cards,",
        "double the chance of each triggering",
      }
    },
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
  ability = { extra = { increaseOddsTimes = 2, triggered = false }},
	loc_vars = function(self, info_queue, card)
    return {vars = {self.ability.extra.increaseOddsTimes}}
  end,
  calculate = function(self, card, context)
    if context.before and context.cardarea == G.jokers then
      print("Hello fixed odds")
      local allAreLucky = true
  
      for _, scoringCard in ipairs(context.scoring_hand) do
         print(scoringCard.debuffed)
         if scoringCard.ability.name ~= 'Lucky Card' then
            allAreLucky = false
         end
      end
  
      if allAreLucky then
        self.ability.extra.triggered = true
        card_eval_status_text(card, "extra", nil, nil, nil, {
          message = "More likely!"
        })
  
        for k, v in pairs(G.GAME.probabilities) do -- this is what oops all sixes does
          G.GAME.probabilities[k] = v * self.ability.extra.increaseOddsTimes
          print(k, G.GAME.probabilities[k])
        end
        allAreLucky = false
      end -- end all are lucky
    elseif context.after and self.ability.extra.triggered then -- clean up after trigger to not inflate all probabilities forever
      for k, v in pairs(G.GAME.probabilities) do -- reset probabilities
       G.GAME.probabilities[k] = v / self.ability.extra.increaseOddsTimes
       print(k, G.GAME.probabilities[k])
      end
      self.ability.extra.triggered = false -- reset state
    end -- end if context 
  end -- end calculate 
})

--[[
local fixed_odds = { -- not yet refactored
    loc = {
        name = "Fixed Odds",
        text = { --G.GAME.probabilities.normal
          "If all scored cards",
          "are {C:attention}Lucky{} cards,",
          "double the chance of each triggering",
        }
    },
    ability_name = "Fixed Odds",
    slug = "dogmod_fixed_odds",
    ability = { extra = { increaseOddsTimes = 2, triggered = false }},
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true
}

-- Initialize Joker
init_joker(fixed_odds)

-- Set local variables
function SMODS.Jokers.j_dogmod_fixed_odds.loc_def(card)
    return {card.ability.extra.increaseOddsTimes}
end

-- Calculate fixed odds
SMODS.Jokers.j_dogmod_fixed_odds.calculate = function(self, context)
  if context.before and context.cardarea == G.jokers then
    print("Hello fixed odds")
    local allAreLucky = true

    for _, scoringCard in ipairs(context.scoring_hand) do
       print(scoringCard.debuffed)
       if scoringCard.ability.name ~= 'Lucky Card' then
          allAreLucky = false
       end
    end

    if allAreLucky then
      self.ability.extra.triggered = true
      card_eval_status_text(self, "extra", nil, nil, nil, {
        message = localize("k_dogmod_odds_up")
      })

      for k, v in pairs(G.GAME.probabilities) do -- this is what oops all sixes does
        G.GAME.probabilities[k] = v*self.ability.extra.increaseOddsTimes
        print(k, G.GAME.probabilities[k])
      end
      allAreLucky = false
    end -- end all are lucky
  elseif context.after and self.ability.extra.triggered then -- clean up after trigger to not inflate all probabilities forever
    for k, v in pairs(G.GAME.probabilities) do -- reset probabilities
     G.GAME.probabilities[k] = v / self.ability.extra.increaseOddsTimes
     print(k, G.GAME.probabilities[k])
    end
    self.ability.extra.triggered = false -- reset state
  end -- end if context 
end -- end calculate  
]]--