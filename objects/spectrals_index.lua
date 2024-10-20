SMODS.Atlas({
    key = 'loteria',
    path = 'loteria.png',
    px = '71',
    py = '95'
})

local spectrals_list = {
    'chrysalis',
}

for _, key in ipairs(spectrals_list) do
    SMODS.load_file('objects/spectrals/'..key..'.lua')()
end