SMODS.Atlas({
    key = 'seals',
    path = 'patches.png',
    px = '34',
    py = '34'
})

local seal_list = {
    'black_seal'
}

for _, key in ipairs(seal_list) do
    SMODS.load_file('objects/seals/'..key..'.lua')()
end