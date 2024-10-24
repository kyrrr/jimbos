SMODS.Joker({
	key = "salary_man",
	atlas = "jokers",
	pos = {x = 2, y = 2},
  --[[loc_txt = {
    name = "Salary Man",
    text = {
      "Gain {C:attention}$#1#{} after",
      "{C:attention}#2#{} hands played.",
      "Increases by {C:attention}$#3#{} every payout.",
      "({C:attention}#4#{} remaining)"
    }
  },]]--
	rarity = 2,
	cost = 6,
  config = { 
    extra = { 
      canRankUp = true,
      tier = 1,
      maxTier = 2,
      payout = 100, 
      raise = 20, 
      start_req = 28, 
      remaining_req = 1,
      txtTier1 = "j_dogmod_salary_man_t1",
      txtTier2 = "j_dogmod_salary_man_t2",
      atlasPosXtier2 = 1,
      atlasPosYtier2 = 1,
    }},
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
  loc_vars = function(self, info_queue, card)
    return { 
      key =  "j_dogmod_salary_man_t" .. card.ability.extra.tier,
      vars = { card.ability.extra.payout, card.ability.extra.start_req, card.ability.extra.raise, card.ability.extra.remaining_req } 
    }
  end,
  calculate = function(self, card, context)
    if context.before and not context.repetition then -- TODO: should count even if hand doesn't score cus pointless work is still work
    
      card.ability.extra.remaining_req = card.ability.extra.remaining_req - 1 -- count down
      if (card.ability.extra.remaining_req == 0) then -- payday!
      
      
        ease_dollars(card.ability.extra.payout) -- get that money
        card_eval_status_text(card, "extra", nil, nil, nil, {
          message = localize("dogmod_payday")
        })
        card_eval_status_text(card, "extra", nil, nil, nil, {
          message = localize("dogmod_raise")
        })
       
        card.ability.extra.payout = card.ability.extra.payout + card.ability.extra.raise -- you get a raise!
        card.ability.extra.remaining_req = card.ability.extra.start_req -- reset counter
      end
    end -- end if context
  end -- end calculate  
})