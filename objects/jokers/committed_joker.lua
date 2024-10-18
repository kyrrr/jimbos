-- Create Joker, not yet refactored
SMODS.Joker({
	key = "committed_joker",
	atlas = "jokers",
	pos = {x = 0, y = 0},
  loc_txt = {
    name = "Committed Joker",
    text = {
        "Retriggers all scored cards #1# time(s)",
        "if played hand is your",
        "{C:attention}most played{} hand"
      }
  },
	rarity = 2,
	cost = 6,
  config = { extra = { retriggers = 1 }},
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	loc_vars = function(self, info_queue, card)
      return {vars = {self.config.extra.retriggers}} 
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.play then
      local handPlayedName = context.scoring_name -- name of the currently played hand
      local numPlayedOfCurrentHandType = (G.GAME.hands[handPlayedName].played or 0) -- how many of the current hand have we played
      local currentPlayedHandTypeisMostPlayed = true -- assume the currently played hand is the highest

    --print(inspect(G.GAME.hand_usage)) might be more efficient?
    --
      for name, type in pairs(G.GAME.hands) do -- loop through all hands
          -- if any other hand is higher than the currently played hand type (and is unlocked e.g. flush five)
          -- do not retrigger 
          if name ~= handPlayedName and type.played >= numPlayedOfCurrentHandType and type.visible then
              currentPlayedHandTypeisMostPlayed = false
          end
      end

    --  print(inspect(card.ability))

      -- TOCONSIDER: should it count if this is the first hand of the run?
      if currentPlayedHandTypeisMostPlayed then
        print(handPlayedName .. " is most played")
       -- card_eval_status_text(card, 'extra', nil, nil, nil, {message = 'Committed!'})
        return {
           message = 'Committed!',
           repetitions = self.config.extra.retriggers,
           card = card
        }
        --  
        --  
       -- }
      end
    end -- end context check
  end -- end calculate 
})

--[[
local committed = {
    loc = {
        name = "Committed Joker",
        text = { --G.GAME.probabilities.normal
          "Retriggers all scored cards",
          "if played hand is your {C:attention}most played{} hand",
        }
    },
    ability_name = "Committed",
    slug = "mmc_committed",
    ability = { extra = { retriggers = 1 }},
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true
}

-- Initialize Joker
init_joker(committed)

-- Set local variables
function SMODS.Jokers.j_mmc_committed.loc_def(card)
    return {card.ability.extra.increaseOddsTimes}
end

-- Calculate committed joker
SMODS.Jokers.j_mmc_committed.calculate = function(self, context, card)
  if context.cardarea == G.play then
    local handPlayedName = context.scoring_name -- name of the currently played hand
    local numPlayedOfCurrentHandType = (G.GAME.hands[handPlayedName].played or 0) -- how many of the current hand have we played
    local isHighest = true -- assume the currently played hand is the highest
    for name, type in pairs(G.GAME.hands) do -- loop through all hands
        -- if any other hand is higher than the currently played hand type (and is unlocked e.g. flush five)
        -- do not retrigger 
        if name ~= handPlayedName and type.played >= numPlayedOfCurrentHandType and type.visible then
            isHighest = false
        end
    end

    if isHighest then
      return {
        message = localize('k_mmc_committed'),
        repetitions = self.ability.extra.retriggers,
        card = self
      }
    end
  end -- end context check
end -- end calculate
]]--