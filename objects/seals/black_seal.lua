SMODS.Seal({
    name = "black_seal",
    key = "black_seal",
    badge_colour = HEX("000000"),
	config = { type = 'destroy' },
    loc_txt = {
        -- Badge name (displayed on card description when seal is applied)
        label = 'Black Seal',
        name = 'Black Seal',
        text = {
            "Destroy this card",
            "after it is scored"
        }
        -- Tooltip description
    
    },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.mult, self.config.chips, self.config.money, self.config.x_mult, } }
    end,
    atlas = "seals",
    pos = {x=0, y=0},

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- repetition_only context is used for red seal retriggers
        if not context.repetition_only and context.cardarea == G.play then
            return {
                mult = self.config.mult,
                chips = self.config.chips,
                dollars = self.config.money,
                x_mult = self.config.x_mult
            }
        end
    end,
})
