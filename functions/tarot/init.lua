function init_tarot(tarot, no_sprite)
    no_sprite = true --no_sprite or false
  
    local new_tarot = SMODS.Tarot:new(
        tarot.name,
        tarot.slug,
        tarot.config,
        { x = 0, y = 0 },
        tarot.loc,
        tarot.cost,
        tarot.cost_mult,
        tarot.effect,
        tarot.consumeable,
        tarot.discovered,
        tarot.atlas
    )
    new_tarot:register()
  
    if not no_sprite then
        local sprite = SMODS.Sprite:new(
            new_tarot.slug,
            SMODS.findModByID("dogmod").path,
            new_tarot.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite:register()
    end
  end