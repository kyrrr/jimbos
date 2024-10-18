SMODS.Joker({
	key = "salary_man",
	atlas = "jokers",
	pos = {x = 0, y = 0},
    loc_txt = {
      name = "Salary Man",
      text = {
        "Gain {C:attention}$#1#{} after",
        "{C:attention}#2#{} hands played.",
        "Increases by {C:attention}$#3#{} every payout.",
        "({C:attention}#4#{} remaining)"
      }
    },
	rarity = 2,
	cost = 6,
  ability = { extra = { payout = 100, raise = 20, start_req = 28, remaining_req = 1 }},
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	loc_vars = function(self, info_queue, card)
      return {vars = {self.ability.extra.payout, self.ability.extra.start_req, self.ability.extra.raise, self.ability.extra.remaining_req}} 
  end,
  calculate = function(self, card, context)
    if context.before and not context.repetition then -- TODO: should count even if hand doesn't score cus pointless work is still work
      self.ability.extra.remaining_req = self.ability.extra.remaining_req - 1 -- count down
      if (self.ability.extra.remaining_req == 0) then -- payday!
        ease_dollars(self.ability.extra.payout) -- get that money
        card_eval_status_text(card, "extra", nil, nil, nil, {
            message = 'Payday!'
        })
        card_eval_status_text(card, "extra", nil, nil, nil, {
          message = 'Raise!'
        })
        
        self.ability.extra.payout = self.ability.extra.payout + self.ability.extra.raise -- you get a raise!
        self.ability.extra.remaining_req = self.ability.extra.start_req -- reset counter
      end
    end -- end if context
  end -- end calculate  
})