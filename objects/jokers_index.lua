SMODS.Atlas({
    key = 'jokers',
    path = 'jokers.png',
    px = '71',
    py = '95'
})

local joker_list = {
    'lucky_seven',
}

for _, key in ipairs(joker_list) do
    SMODS.load_file('objects/jokers/'..key..'.lua')()
end