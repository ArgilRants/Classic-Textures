ctex = ctex or {}

-- Buttons
function G.FUNCS.ctex_github(e)
    love.system.openURL("https://github.com/ArgilRants/Classic-Textures")
end

function G.FUNCS.ctex_capture_all(e)
    love.system.openURL("https://github.com/ArgilRants/Capture-All")
end

function G.FUNCS.ctex_discord(e)
    love.system.openURL("https://discord.com/channels/1116389027176787968/1558075796281630871")
end

function G.FUNCS.ctex_wiki(e)
    love.system.openURL("https://balatromods.miraheze.org/wiki/Classic_Textures")
end

function G.FUNCS.ctex_reset_options(e)
    classic_textures.config.classic_negative_shader = false
    classic_textures.config.classic_debuff_shader = false
    classic_textures.config.bordered_sin_jokers = false
    classic_textures.config.extra_info = false
    classic_textures.config.badge = true
end

function G.FUNCS.ctex_recommended_options(e)
    classic_textures.config.classic_negative_shader = true
    classic_textures.config.classic_debuff_shader = false
    classic_textures.config.bordered_sin_jokers = false
    classic_textures.config.extra_info = true
    classic_textures.config.badge = true
end

function G.FUNCS.ctex_all_options(e)
    classic_textures.config.classic_negative_shader = true
    classic_textures.config.classic_debuff_shader = true
    classic_textures.config.bordered_sin_jokers = true
    classic_textures.config.extra_info = true
    classic_textures.config.badge = true
end

-- Custom graident for 'Creator' badge
G.C.CTEX_CREATOR = SMODS.Gradient{
    key = "creator",
    colours = {G.C.GOLD,G.C.BLUE,G.C.RED},
    cycle = 7,
    interpolation = 'linear'
}

-- Custom graident for 'Classic Textures' badge
G.C.CTEX_BADGE = SMODS.Gradient{
    key = "badge",
    colours = {HEX("708b91"),G.C.GREEN,G.C.BLUE,G.C.RED},
    cycle = 7,
    interpolation = 'linear'
}

-- Create cards:
function ctex_create_main_menu_card()
    card = {
        {front = "H_K", edition = "e_negative"},
        {front = "H_5", edition = "e_negative"},
        {front = "C_J", edition = "e_negative"},
        {front = "S_K", edition = "e_negative"},
    }
    num = math.random(1, 4)
    return card[num]
end

function ctex_create_janadlatro()
    card = SMODS.create_card{set = "Base", front = "C_9", edition = "e_polychrome", enhancement = "m_steel", seal = "Blue", silent = true, immediate = true, area = G.title_top, scale = {w = 0.7, h = 0.7}}
    card:set_debuff(true)
    return card
end

function ctex_create_negative_joker_example()
    card = SMODS.create_card{key = "j_smeared", edition = "e_negative", silent = true, immediate = true, area = G.title_top, scale = {w = 0.7, h = 0.7}}
    return card
end

function ctex_create_negative_consumable_example()
    card = SMODS.create_card{key = "c_lovers", edition = "e_negative", silent = true, immediate = true, skip_materialize = true, area = G.title_top, scale = {w = 0.7, h = 0.7}}
    return card
end

function ctex_create_negative_consumable_example_2()
    card = SMODS.create_card{key = "c_sigil", edition = "e_negative", silent = true, immediate = true, skip_materialize = true, area = G.title_top, scale = {w = 0.7, h = 0.7}}
    return card
end

function ctex_create_debuffed_joker_example()
    card = SMODS.create_card{key = "j_smeared", edition = "e_polychrome", silent = true, immediate = true, area = G.title_top, scale = {w = 0.7, h = 0.7}}
    card:set_debuff(true)
    return card
end

function ctex_create_debuffed_joker_example_2()
    card = SMODS.create_card{key = "j_hologram", silent = true, immediate = true, area = G.title_top, scale = {w = 0.7, h = 0.7}}
    card:set_debuff(true)
    return card
end

function ctex_create_debuffed_card_example()
    card = SMODS.create_card{set = "Base", front = "H_Q", edition = "e_holo", enhancement = "m_wild", seal = "Red", silent = true, immediate = true, area = G.title_top, scale = {w = 0.7, h = 0.7}}
    card:set_debuff(true)
    return card
end

-- Check if pack is selected in anyway
function ctex.is_pack_active(check_pack)
    if not (Malverk and Malverk.config and Malverk.config.selected) then return false end
    for _, pack in ipairs(Malverk.config.selected) do
        if pack == check_pack then return true end
    end
    return false
end

-- Check if a textures key is set to true in that specific packs config
function ctex.is_texture_active(check_pack, check_texture, key)
    if not (Malverk and Malverk.config and Malverk.config.texture_configs) then return false end
    if Malverk.config.texture_configs[check_pack][check_texture] == true then 
        if check_texture == "alt_tex_ctex_stake" then 
            if G.P_STAKES["stake_gold"].atlas == check_texture then
                return true
            end
        else
            if key and G.P_CENTERS[key].atlas == check_texture then
                return true 
            end
        end
    end
    return false
end

-- Update stuff when Malverk updates the atlas'
local ref_update_atlas = Malverk.update_atlas
function Malverk.update_atlas(...)
    ctex_square_check()
    ctex_set_loc()
    for _, pack in ipairs(Malverk.config.selected) do
        if pack == "texpack_ctex_unusedsprites" then 
            unused_index = _
        elseif pack == "texpack_ctex_changedsprites" then
            changed_index = _
        end
    end
    if ctex.is_pack_active('texpack_ctex_unusedsprites') then
        ctex.UNUSED_TEXT_CENTERS = {
            j_scholar = nil,
		    j_diet_cola = nil,
            j_ancient = nil,
            j_selzer = nil,
            j_bloodstone = nil,
            j_obelisk = nil,
            j_oops = nil,
        }

        if ctex.is_texture_active('texpack_ctex_unusedsprites', 'alt_tex_ctex_scholar','j_scholar') then ctex.UNUSED_TEXT_CENTERS.j_scholar = true end
        if ctex.is_texture_active('texpack_ctex_unusedsprites', 'alt_tex_ctex_diet_cola', 'j_diet_cola') then ctex.UNUSED_TEXT_CENTERS.j_diet_cola = true end
        if ctex.is_texture_active('texpack_ctex_unusedsprites', 'alt_tex_ctex_ancient', 'j_ancient') then ctex.UNUSED_TEXT_CENTERS.j_ancient = true end
        if ctex.is_texture_active('texpack_ctex_unusedsprites', 'alt_tex_ctex_selzer', 'j_selzer') then ctex.UNUSED_TEXT_CENTERS.j_selzer = true end
        if ctex.is_texture_active('texpack_ctex_unusedsprites', 'alt_tex_ctex_bloodstone', 'j_bloodstone') then ctex.UNUSED_TEXT_CENTERS.j_bloodstone = true end
        if ctex.is_texture_active('texpack_ctex_unusedsprites', 'alt_tex_ctex_obelisk', 'j_obelisk') then ctex.UNUSED_TEXT_CENTERS.j_obelisk = true end
        if ctex.is_texture_active('texpack_ctex_unusedsprites', 'alt_tex_ctex_oops', 'j_oops') then ctex.UNUSED_TEXT_CENTERS.j_oops = true end
        if ctex.is_texture_active('texpack_ctex_unusedsprites', 'alt_tex_ctex_shoot_the_moon', 'j_shoot_the_moon') then ctex.UNUSED_TEXT_CENTERS.j_shoot_the_moon = true end
        if ctex.is_texture_active('texpack_ctex_unusedsprites', 'alt_tex_ctex_retcon', 'v_retcon') then ctex.UNUSED_TEXT_CENTERS.v_retcon = true end

    else
        ctex.UNUSED_TEXT_CENTERS = {

        }
    end

    if ctex.is_pack_active('texpack_ctex_changedsprites') then
        ctex.CHANGED_TEXT_CENTERS = {
            j_flash = nil,
            j_invisible = nil,
            j_square = nil,
            j_caino = nil,
            j_8_ball = nil,
            j_arrowhead = nil,
            j_blueprint = nil,
            j_ceremonial = nil,
            j_oops = nil,
            j_pareidolia = nil,
            j_scary_face = nil,
            j_sock_and_buskin = nil,
            j_fortune_teller = nil,
            j_jolly = nil,
            j_wrathful_joker = nil,
            j_lusty_joker = nil,
            j_greedy_joker = nil,
            j_gluttenous_joker = nil,
            j_zany = nil,
            j_mad = nil,
            j_crazy = nil,
            c_soul = nil,
            b_erratic = nil,
            v_retcon = nil,
            c_pluto = nil,
            c_mercury = nil,
            c_uranus = nil,
            c_venus = nil,
            c_saturn = nil,
            c_jupiter = nil,
            c_earth = nil,
            c_mars = nil,
            c_neptune = nil,
            c_planet_x = nil,
            c_ceres = nil,
            c_eris = nil,
            j_astronomer = nil,
        }

        -- Enable Sin Jokers:
        ctex.CHANGED_TEXT_CENTERS.j_wrathful_joker = true
        ctex.CHANGED_TEXT_CENTERS.j_lusty_joker = true 
        ctex.CHANGED_TEXT_CENTERS.j_greedy_joker = true 
        ctex.CHANGED_TEXT_CENTERS.j_gluttenous_joker = true

        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_flash', 'j_flash') then ctex.CHANGED_TEXT_CENTERS.j_flash = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_invisible', 'j_invisible') then ctex.CHANGED_TEXT_CENTERS.j_invisible = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_square', 'j_square') then ctex.CHANGED_TEXT_CENTERS.j_square = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_caino', 'j_caino') then ctex.CHANGED_TEXT_CENTERS.j_caino = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_8_ball', 'j_8_ball') then ctex.CHANGED_TEXT_CENTERS.j_8_ball = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_arrowhead', 'j_arrowhead') then ctex.CHANGED_TEXT_CENTERS.j_arrowhead = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_blueprint', 'j_blueprint') then ctex.CHANGED_TEXT_CENTERS.j_blueprint = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_ceremonial', 'j_ceremonial') then ctex.CHANGED_TEXT_CENTERS.j_ceremonial = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_oops_borderless', 'j_oops') then ctex.CHANGED_TEXT_CENTERS.j_oops = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_pareidolia', 'j_pareidolia') then ctex.CHANGED_TEXT_CENTERS.j_pareidolia = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_scary_face', 'j_scary_face') then ctex.CHANGED_TEXT_CENTERS.j_scary_face = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_sock_and_buskin', 'j_sock_and_buskin') then ctex.CHANGED_TEXT_CENTERS.j_sock_and_buskin = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_fortune_teller', 'j_fortune_teller') then ctex.CHANGED_TEXT_CENTERS.j_fortune_teller = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_jolly', 'j_jolly') then ctex.CHANGED_TEXT_CENTERS.j_jolly = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_zany', 'j_zany') then ctex.CHANGED_TEXT_CENTERS.j_zany = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_mad', 'j_mad') then ctex.CHANGED_TEXT_CENTERS.j_mad = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_crazy', 'j_crazy') then ctex.CHANGED_TEXT_CENTERS.j_crazy = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_soul', 'c_soul') then ctex.CHANGED_TEXT_CENTERS.c_soul = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_erratic', 'b_erratic') then ctex.CHANGED_TEXT_CENTERS.b_erratic = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_pluto', 'c_pluto') then ctex.CHANGED_TEXT_CENTERS.c_pluto = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_mercury', 'c_mercury') then ctex.CHANGED_TEXT_CENTERS.c_mercury = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_uranus', 'c_uranus') then ctex.CHANGED_TEXT_CENTERS.c_uranus = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_venus', 'c_venus') then ctex.CHANGED_TEXT_CENTERS.c_venus = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_saturn', 'c_saturn') then ctex.CHANGED_TEXT_CENTERS.c_saturn = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_jupiter', 'c_jupiter') then ctex.CHANGED_TEXT_CENTERS.c_jupiter = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_earth', 'c_earth') then ctex.CHANGED_TEXT_CENTERS.c_earth = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_mars', 'c_mars') then ctex.CHANGED_TEXT_CENTERS.c_mars = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_neptune', 'c_neptune') then ctex.CHANGED_TEXT_CENTERS.c_neptune = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_planet_x', 'c_planet_x') then ctex.CHANGED_TEXT_CENTERS.c_planet_x = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_ceres', 'c_ceres') then ctex.CHANGED_TEXT_CENTERS.c_ceres = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_eris', 'c_eris') then ctex.CHANGED_TEXT_CENTERS.c_eris = true end
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_astronomer', 'j_astronomer') then ctex.CHANGED_TEXT_CENTERS.j_astronomer = true end

    else
        ctex.CHANGED_TEXT_CENTERS = {

        }

    end

    return ref_update_atlas(...)
end

local ref_card_h_popup = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
    ctex.popup_card = card
    local ret = ref_card_h_popup(card)
    ctex.popup_card = nil
    return ret
end

-- Hook into when mod badges would be drawn
if SMODS.create_mod_badges then
    local ref_create_mod_badges = SMODS.create_mod_badges
    function SMODS.create_mod_badges(obj, badges)
        ref_create_mod_badges(obj, badges)
        local card = ctex.popup_card
        if card and obj and obj == (card.config and card.config.center) and ctex.is_affected(card) and classic_textures.config.badge == true then
            badges[#badges + 1] = ctex.create_badge(card)
        end
    end
end

-- Check if a card is changed by either classic textures packs
function ctex.is_affected(card)
    if not card then return false end

    local center = card.config and card.config.center
    local key = center and center.key
    if not key then return false end
    if ctex.UNUSED_TEXT_CENTERS[key] then return true end
    if ctex.CHANGED_TEXT_CENTERS[key] then return true end
    return false
end

-- Create custom Classic Textures badge
function ctex.create_badge(card)
    local badge = create_badge(localize('k_ctex'), G.C.CTEX_BADGE, G.C.WHITE, 1) 
    return badge
end

-- Check if square is enabled, and alter its pixel size
function ctex_square_check()
    if ctex.is_pack_active('texpack_ctex_changedsprites') then
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_square', 'j_square') then
            G.P_CENTERS.j_square.pixel_size = {h = 124}
            if G.jokers and G.jokers.card then
                for j, card in ipairs(G.jokers.cards) do 
                    if card.config.center.key == 'j_square' then
                        card:set_sprites(card.config.center)
                    end
                end
            end
        else
            G.P_CENTERS.j_square.pixel_size = nil
            if G.jokers and G.jokers.card then
                for j, card in ipairs(G.jokers.cards) do 
                    if card.config.center.key == 'j_square' then
                        card:set_sprites(card.config.center)
                    end
                end
            end
        end
    else 
        G.P_CENTERS.j_square.pixel_size = nil
        if G.jokers and G.jokers.card then
            for j, card in ipairs(G.jokers.cards) do 
                if card.config.center.key == 'j_square' then
                    card:set_sprites(card.config.center)
                end
            end
        end
    end
end

-- Check is unsued sprites pack is enabled and then check if the stakes (the star stake stickers) are enabled and then change the Localisation
function ctex_set_loc()
    if ctex.is_pack_active('texpack_ctex_unusedsprites') then
        -- Sticker Loc
        if ctex.is_texture_active("texpack_ctex_unusedsprites", "alt_tex_ctex_stake") then
            G.localization.descriptions.Other.white_sticker.name = 'White Star'
            G.localization.descriptions.Other.red_sticker.name = 'Red Star'
            G.localization.descriptions.Other.green_sticker.name = 'Green Star'
            G.localization.descriptions.Other.black_sticker.name = 'Black Star'
            G.localization.descriptions.Other.blue_sticker.name = 'Blue Star'
            G.localization.descriptions.Other.purple_sticker.name = 'Purple Star'
            G.localization.descriptions.Other.orange_sticker.name = 'Orange Star'
            G.localization.descriptions.Other.gold_sticker.name = 'Gold Star'
        else
            G.localization.descriptions.Other.white_sticker.name = 'White Sticker'
            G.localization.descriptions.Other.red_sticker.name = 'Red Sticker'
            G.localization.descriptions.Other.green_sticker.name = 'Green Sticker'
            G.localization.descriptions.Other.black_sticker.name = 'Black Sticker'
            G.localization.descriptions.Other.blue_sticker.name = 'Blue Sticker'
            G.localization.descriptions.Other.purple_sticker.name = 'Purple Sticker'
            G.localization.descriptions.Other.orange_sticker.name = 'Orange Sticker'
            G.localization.descriptions.Other.gold_sticker.name = 'Gold Sticker'
        end
    else
        G.localization.descriptions.Other.white_sticker.name = 'White Sticker'
        G.localization.descriptions.Other.red_sticker.name = 'Red Sticker'
        G.localization.descriptions.Other.green_sticker.name = 'Green Sticker'
        G.localization.descriptions.Other.black_sticker.name = 'Black Sticker'
        G.localization.descriptions.Other.blue_sticker.name = 'Blue Sticker'
        G.localization.descriptions.Other.purple_sticker.name = 'Purple Sticker'
        G.localization.descriptions.Other.orange_sticker.name = 'Orange Sticker'
        G.localization.descriptions.Other.gold_sticker.name = 'Gold Sticker'
    end
        
end

-- Create credits card area
function ctex_create_credits()
    local set = credits_jokers[1]
    G.ctex_credit_jokers = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
        G.ROOM.T.h,
        4.25 * G.CARD_W,
        0.95 * G.CARD_H,
        { card_limit = #set, type = "title", highlight_limit = 0, collection = true }
    )
	for i, center in pairs(set) do
		local card = Card(
			G.ctex_credit_jokers.T.x + (G.ctex_credit_jokers.T.w / 2),
			G.ctex_credit_jokers.T.y,
			G.CARD_W,
			G.CARD_H,
			G.P_CARDS.empty,
			G.P_CENTERS[center],
			{
				bypass_discovery_center = true,
				bypass_discovery_ui = true,
				bypass_lock = true,
			}
		)
		G.ctex_credit_jokers:emplace(card)
		card.sprite_facing = "front"
		card.facing = "front"
		card:start_materialize({ G.C.RED }, true)
	end
    return G.ctex_credit_jokers
end

-- Create sin jokers card area in config
function ctex_create_sin_jokers()
    local set = sin_jokers[1]
    G.ctex_sin_jokers = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
        G.ROOM.T.h,
        (5 * G.CARD_W) * 0.7,
        (1.1 * G.CARD_H) * 0.7,
        { card_limit = #set, type = "title", highlight_limit = 0, collection = true }
    )
	for i, center in pairs(set) do
		local card = Card(
			G.ctex_sin_jokers.T.x + (G.ctex_sin_jokers.T.w / 2),
			G.ctex_sin_jokers.T.y,
			G.CARD_W * 0.7,
			G.CARD_H * 0.7,
			G.P_CARDS.empty,
			G.P_CENTERS[center],
			{
				bypass_discovery_center = true,
				bypass_discovery_ui = true,
				bypass_lock = true,
			}
		)
		G.ctex_sin_jokers:emplace(card)
		card.sprite_facing = "front"
		card.facing = "front"
	end
    return G.ctex_sin_jokers
end

-- Create negative examples card area in config
function ctex_create_negative_examples()
    G.ctex_negative_examples = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
        G.ROOM.T.h,
        (3 * G.CARD_W) * 0.7,
        (1.1 * G.CARD_H) * 0.7,
        { card_limit = 2, type = "title", highlight_limit = 0, collection = true }
    )
    local joker_example = ctex_create_negative_joker_example()
    local consumable_example = ctex_create_negative_consumable_example()
    local consumable_example_2 = ctex_create_negative_consumable_example_2()
    G.ctex_negative_examples:emplace(joker_example)
    G.ctex_negative_examples:emplace(consumable_example)
    G.ctex_negative_examples:emplace(consumable_example_2)
    joker_example.sprite_facing = "front"
    joker_example.facing = "front"
    consumable_example.sprite_facing = "front"
    consumable_example.facing = "front"
    consumable_example_2.sprite_facing = "front"
    consumable_example_2.facing = "front"
    return G.ctex_negative_examples
end

-- Create debuff examples card area in config
function ctex_create_debuff_examples()
    G.ctex_debuff_examples = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
        G.ROOM.T.h,
        (3 * G.CARD_W) * 0.7,
        (1.1 * G.CARD_H) * 0.7,
        { card_limit = 2, type = "title", highlight_limit = 0, collection = true }
    )
    local joker_example = ctex_create_debuffed_joker_example()
    local joker_example_2 = ctex_create_debuffed_joker_example_2()
    local card_example = ctex_create_debuffed_card_example()
    G.ctex_debuff_examples:emplace(joker_example)
    G.ctex_debuff_examples:emplace(joker_example_2)
    G.ctex_debuff_examples:emplace(card_example)
    joker_example.sprite_facing = "front"
    joker_example.facing = "front"
    joker_example_2.sprite_facing = "front"
    joker_example_2.facing = "front"
    card_example.sprite_facing = "front"
    card_example.facing = "front"
    return G.ctex_debuff_examples
end

-- Add tooltips if extra tooltips are enabled
local old_generate_card_ui = generate_card_ui
function generate_card_ui(center, ...)
    local full_ui_table = old_generate_card_ui(center, ...)
    local key = center.key
    if classic_textures.config.extra_info then 
        if unused_index ~= nil and changed_index ~= nil then 
            if unused_index > changed_index then
                if ctex.UNUSED_TEXT_CENTERS[key] then 
                    old_generate_card_ui({key = "unused_" .. key, set = "Other"}, full_ui_table)
                elseif ctex.CHANGED_TEXT_CENTERS[key] then 
                    old_generate_card_ui({key = "changed_" .. key, set = "Other"}, full_ui_table)
                end
            elseif changed_index > unused_index then
                if ctex.CHANGED_TEXT_CENTERS[key] then 
                    old_generate_card_ui({key = "changed_" .. key, set = "Other"}, full_ui_table)
                elseif ctex.UNUSED_TEXT_CENTERS[key] then 
                    old_generate_card_ui({key = "unused_" .. key, set = "Other"}, full_ui_table)
                end
            end
        elseif unused_index ~= nil and changed_index == nil then 
            if ctex.UNUSED_TEXT_CENTERS[key] then 
                old_generate_card_ui({key = "unused_" .. key, set = "Other"}, full_ui_table)
            end
        elseif changed_index ~= nil and unused_index == nil then
            if ctex.CHANGED_TEXT_CENTERS[key] then 
                old_generate_card_ui({key = "changed_" .. key, set = "Other"}, full_ui_table)
            end 
        end
    end
    
    return full_ui_table
end