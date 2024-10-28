SMODS.Spectral({
    key = "banishment", 
    config = {
      max_highlighted = 3,
    }, 
    loc_txt = {
        name = 'Banishment',
        text = {
            "Add a {C:spades}Black seal{}",
            "to up to {C:attention}#1#{} selected cards"
        },
    },
    pos = {x = 2, y = 2}, 
    unlocked = true, 
    discovered = true, 
    atlas = "loteria",
    loc_vars = function(self, info_queue, card)
      return {vars = { 3 }}
    end,
    can_use = function (self, card)
      local num_highlighted = #G.hand.highlighted
      return num_highlighted > 0 and num_highlighted < 4 
    end,
    use = function(self, card)
      for i = 1, #G.hand.highlighted do
        local conv_card = G.hand.highlighted[i]
        G.E_MANAGER:add_event(Event({func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            conv_card:set_seal('dogmod_black_seal', nil, true)
            return true end }))
      end
      
      
      delay(0.5)
      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end,
    in_pool = function(self)
      return true
    end
  })