SMODS.Joker({
	key = "lucky_seven",
	atlas = "jokers",
	pos = {x = 0, y = 0},
	rarity = 2,
	cost = 7,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	config = {
    extra = { 
        rankToTransform = 7, 
        tier = 2, 
        maxTier = 2,
        txtTier1 = "Tier 1 text",
        txtTier2 = "Tier 2 text",
    }},
	loc_vars = function(self, info_queue, card)
        return {vars = { "world" }} 
    end,
    calculate = function(self, card, context)
        if context.game_over then
            self.config.extra.tier = 1
        elseif context.before and context.cardarea == G.jokers then 
            local sevens = {} -- store the cards that should be upgraded
            for _, scoringCard in ipairs(context.scoring_hand) do -- loop thru all scored cards
                if scoringCard:get_id() == self.config.extra.rankToTransform and not scoringCard.debuff then -- is it a non-debuffed 7?
                    sevens[#sevens+1] = scoringCard -- save it
                    scoringCard:set_ability(G.P_CENTERS.m_lucky, nil, true) -- make it lucky. TOFIGUREOUT: what initial = nil does
                    print(scoringCard.seal)
                    if self.config.extra.tier > 1 and not scoringCard.seal then
                        scoringCard:set_seal("Gold", true)
                    end
                    print(scoringCard.seal)
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
                    message = "Lucky!!!!",
                    card = self,
                }
            end
        elseif context.individual and context.cardarea == G.play then
            print("hello")
        end -- end if context
    end -- end calculate 
})