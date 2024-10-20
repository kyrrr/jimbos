SMODS.Atlas({
    key = 'jokers',
    path = 'jokers.png',
    px = '71',
    py = '95'
})

local joker_list = {
    'lucky_seven',
   -- 'salary_man',
   -- 'fixed_odds',
   -- 'committed_joker'
}

for _, key in ipairs(joker_list) do
    SMODS.load_file('objects/jokers/'..key..'.lua')()
end

--[[if DogMod.config.placeholders then
    for i=1, 151-#joker_list do
        SMODS.Joker({
            key = 'ortalab_temp_'..i,
            pos = {x = 8, y = 9},
            loc_txt = {
                name = 'Locked',
                text = {'{E:1}???'}
            },
            discovered = true,
            ortalab_demo_card = true,
            rarity = nil,
            in_pool = function(self)
                return false
            end,
            loc_vars = function(self, info_queue, card)
                info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'no_demo', title = 'Not In Demo'}
            end
        })
    end
end]]--
--[[
function Ortalab.remove_joker(card)
    G.E_MANAGER:add_event(Event({
        func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                        G.jokers:remove_card(card)
                        card:remove()
                        card = nil
                    return true
            end}))
            return true
    end}))
end

function SMODS.current_mod.reset_game_globals(first_pass)
	if first_pass then
		G.GAME.current_round["spectral_type_sold"] = {}
		G.GAME.current_round["ortalab_free_rerolls"] = 0
	end
end]]--