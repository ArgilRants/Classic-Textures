-- Global variables:
classic_textures = SMODS.current_mod

classic_textures_unused_index = nil
classic_textures_changed_index = nil

-- list of sin jokers
sin_jokers = {
    {
        "j_greedy_joker",
        "j_lusty_joker",
        "j_wrathful_joker",
        "j_gluttenous_joker",
    }
}

-- List of credits jokers
credits_jokers = {
    {
        "j_ctex_argil",
        "j_ctex_lilo",
        "j_ctex_zebra",
        "j_ctex_jandom",
    }
}

-- Load all the files:
assert(SMODS.load_file('src/functions.lua'))()
assert(SMODS.load_file('src/alttextures.lua'))()
assert(SMODS.load_file('src/shaders.lua'))()
assert(SMODS.load_file('src/credits.lua'))()
assert(SMODS.load_file('src/config.lua'))()

-- Add 'easter egg' to main menu
classic_textures.menu_cards = function()
    return {
        remove_original = true,
        create_main_menu_card()
    }
end