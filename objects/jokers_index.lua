SMODS.Atlas({
    key = 'jokers',
    path = 'jokers.png',
    px = '71',
    py = '95'
})

local custom_joker_list = {
    'lucky_seven',
    'salary_man',
    'committed_joker',
}


local upgraded_vanillas = { -- see lovely.toml for how these are patched. these only change the descriptions
    'baron',
    'bloodstone'
}


for _, key in ipairs(custom_joker_list) do
    SMODS.load_file('objects/jokers/'..key..'.lua')()
end

for _, key in ipairs(upgraded_vanillas) do
    SMODS.load_file('objects/jokers/tiered_vanillas/'..key..'.lua')()
end
