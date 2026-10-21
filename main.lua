-- Variables:
mod = SMODS.current_mod

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

-- Load all the files (Seperated everything because god this was a nightmare before lol)
assert(SMODS.load_file('src/functions.lua'))()
assert(SMODS.load_file('src/alttextures.lua'))()
assert(SMODS.load_file('src/shaders.lua'))()
assert(SMODS.load_file('src/credits.lua'))()
assert(SMODS.load_file('src/config.lua'))()

-- Check for Star Sticker Pack / Changed Sprites Pack and change the loc
mod.process_loc_text = function()
    set_sticker_loc()
    set_seal_loc()
end

-- Set Negative edition to main menu card
mod.menu_cards = function()
    return {
        -- func = function()
		-- 	G.title_top.cards[1]:set_edition("e_negative")
		-- end
        remove_original = true,
        create_main_menu_card()
    }
end

-- Check for changed Square Joker sprite at load.
square_check()