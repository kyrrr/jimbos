function init_joker(joker, no_sprite)
    no_sprite = true--no_sprite or false
  
    local new_joker = SMODS.Joker:new(
        joker.ability_name,
        joker.slug,
        joker.ability,
        { x = 0, y = 0 },
        joker.loc,
        joker.rarity,
        joker.cost,
        joker.unlocked,
        joker.discovered,
        joker.blueprint_compat,
        joker.eternal_compat,
        joker.effect,
        joker.atlas,
        joker.soul_pos
    )
    new_joker:register()
  
    if not no_sprite then
        local sprite = SMODS.Sprite:new(
            new_joker.slug,
            SMODS.findModByID("dogmod").path,
            new_joker.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite:register()
    end
  end