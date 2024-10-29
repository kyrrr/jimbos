SMODS.Joker({
	key = "salary_man",
	atlas = "jokers",
	pos = {x = 2, y = 2},
	rarity = 2,
	cost = 6,
  config = { 
    extra = { -- see rank_up.lua for how these are modified
      canRankUp = true,
      tier = 1,
      maxTier = 2,
      payout = 100, 
      raise = 20, 
      start_req = 28, 
      remaining_req = 28,
      voucherSize = 2,
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