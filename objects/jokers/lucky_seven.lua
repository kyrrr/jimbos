SMODS.Joker({
	key = "lucky_seven",
	atlas = "jokers",
	pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Hello',
        text = {
            "All played {C:attention}7s{}",
            "become {C:attention}Lucky{} cards",
            "when scored"
        }
    },
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	config = {extra = {}},
	loc_vars = function(self, info_queue, card)
        return {vars = {}} 
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then 
        local sevens = {} -- store the cards that should be upgraded
        for _, card in ipairs(context.scoring_hand) do
            if card:get_id() == 7 and not card.debuff then 
                sevens[#sevens+1] = card
                card:set_ability(G.P_CENTERS.m_lucky, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
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