-- Global variables:
classic_textures = SMODS.current_mod

old_soul_config = Malverk.config.texture_configs["texpack_ctex_changedsprites"]["alt_tex_ctex_soul"] or nil

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

-- Check for Unused / Changed Sprites Pack and change the loc
classic_textures.process_loc_text = function()
    set_sticker_loc()
    set_seal_loc()
end

-- Add 'easter egg' to main menu
classic_textures.menu_cards = function()
    return {
        remove_original = true,
        create_main_menu_card()
    }
end

-- Check for changed Square Joker sprite at load.
square_check()