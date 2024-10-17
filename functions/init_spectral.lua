function init_spectral(spectral, no_sprite)
    no_sprite = true --no_sprite or false
  
    local new_spectral = SMODS.Spectral:new(
        spectral.name,
        spectral.slug,
        spectral.config,
        { x = 0, y = 0 },
        spectral.loc,
        spectral.cost,
        spectral.consumeable,
        spectral.discovered,
        spectral.atlas
    )
    new_spectral:register()
  
    if not no_sprite then
        local sprite = SMODS.Sprite:new(
            new_spectral.slug,
            SMODS.findModByID("dogmod").path,
            new_spectral.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite:register()
    end
  end