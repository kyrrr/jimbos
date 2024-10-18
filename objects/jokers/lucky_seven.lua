SMODS.Joker({
	key = "lucky_seven",
	atlas = "jokers",
	pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Lucky 7',
        text = {
            "All played {C:attention}#1#s{}",
            "become {C:attention}Lucky{} cards",
            "when scored"
        }
    },
	rarity = 2,
	cost = 7,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	config = {extra = { rankToTransform = 7 }},
	loc_vars = function(self, info_queue, card)
        return {vars = { self.config.extra.rankToTransform }} 
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then 
        local sevens = {} -- store the cards that should be upgraded
        for _, scoringCard in ipairs(context.scoring_hand) do -- loop thru all scored cards
            if scoringCard:get_id() == self.config.extra.rankToTransform and not scoringCard.debuff then -- is it a non-debuffed 7?
                sevens[#sevens+1] = scoringCard -- save it
                scoringCard:set_ability(G.P_CENTERS.m_lucky, nil, true) -- make it lucky. TOFIGUREOUT: what initial = nil does
                G.E_MANAGER:add_event(Event({
                    func = function()
                        scoringCard:juice_up()
                        return true
                    end
                })) 
            end
        end
        if #sevens > 0 then 
            return {
                message = "Lucky!",
                card = self
            }
        end
        end -- end if context
    end -- end calculate 
})