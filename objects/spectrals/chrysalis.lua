SMODS.Spectral({
    key = "chrysalis", 
    config = {
      --mod_conv = sealId .. '_seal',
      --seal = { money = 1 },
      max_highlighted = 1,
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
      return {vars = {}}
    end,
    can_use = function (self, card)
      for k, v in pairs(G.jokers.cards) do
        if v.ability
           and v.ability.set == 'Joker'
           and type(v.ability.extra) == 'table'
           and v.ability.extra.canRankUp 
           and type(v.ability.extra.tier) == "number"
           and type(v.ability.extra.maxTier) == "number"
           and v.ability.extra.tier < v.ability.extra.maxTier
        then 
            return true
        end
      end
    end,
    use = function(self, card)
      local jimbos = {}
      for k, v in pairs(G.jokers.cards) do
        if v.ability.set == 'Joker' and v.ability.extra.canRankUp then 
            table.insert(jimbos, v)
        end
      end

      if #jimbos then
        local randomEligibleJimbo = pseudorandom_element(jimbos,pseudoseed(self.key))
        if randomEligibleJimbo then
          randomEligibleJimbo:rank_up()
        end
      end
    
      return true
    end,
    in_pool = function(self)
      return true
    end
  })