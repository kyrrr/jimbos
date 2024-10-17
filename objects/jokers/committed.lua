-- Create Joker, not yet refactored
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