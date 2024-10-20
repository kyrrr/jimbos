SMODS.Spectral({
    key = "chrysalis", 
    config = {
      --mod_conv = sealId .. '_seal',
      --seal = { money = 1 },
      --max_highlighted = 1,
      dollars = 100
    }, 
    loc_txt = {
        name = 'Chrysalis',
        text = {
            "Upgrade a random Joker",
            "to its next tier"
        },
    },
    pos = {x = 0, y = 2}, 
    unlocked = true, 
    discovered = true, 
    atlas = "loteria",
    loc_vars = function(self, info_queue, card)
      --info_queue[#info_queue + 1] = {
       -- set = "Other",
        --key = sealId .. '_seal',
        --specific_vars = {self.config.seal.money},
      --}
      return {vars = {100}}
    end,
    can_use = function ()
        return true
    end,
    use = function(self, card)
        ease_dollars(card.ability.dollars)
      --if G.FUNCS.is_versus_game() then
        --[[for i = 1, card.ability.max_highlighted do
          local highlighted = G.hand.highlighted[i]
          if highlighted then
            highlighted:set_seal(sealId)
          else
            break
          end
        end]]--
        return true
      --end
    end,
    in_pool = function(self)
      return true
    end
  })