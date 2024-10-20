--- STEAMODDED HEADER
--- MOD_NAME: DogMod
--- MOD_ID: dogmod
--- MOD_AUTHOR: [dog]
--- MOD_DESCRIPTION: Learn by stealing
--- DISPLAY_NAME: DogMod
--- MOD_PREFIX: dogmod
----------------------------------------------
------------MOD CODE -------------------------

DogMod = SMODS.current_mod

JimboTiers = {}
JimboTiers.upgradePaths = {}

SMODS.load_file('objects/jokers_index.lua')()
SMODS.load_file('objects/seals_index.lua')()
SMODS.load_file('objects/spectrals_index.lua')()

