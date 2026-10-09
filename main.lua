local mod = SMODS.current_mod

mod.config = mod.config or {}
if mod.config.classic_negative_shader == nil then mod.config.classic_negative_shader = false end
if mod.config.classic_debuff_shader == nil then mod.config.classic_debuff_shader = false end
G.classic_textures_config = mod.config_tab

mod.credits_tab = function()
 return {n = G.UIT.ROOT, config = {align = "tm", minh=7.5, minw=7.5, padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK}, 
 nodes = {
	{n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
        {n = G.UIT.T, config = {text = "Developers:", scale = 0.5, colour = G.C.CHIPS}},
    }},
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n = G.UIT.T, config = {text = "ArgilRants ", juice = true, scale = 0.4, colour = G.C.CHIPS}},
        {n = G.UIT.T, config = {text = "with help from ", scale = 0.4, colour = G.C.WHITE}},
        {n = G.UIT.T, config = {text = "LilacLila", juice = true, scale = 0.4, colour = HEX("fccfd8ff"), tooltip = {title = "Check out", text = {"Rebalatro and PolyTrans", "@ github/lilaclila"}}}},
    }},
    {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
        {n = G.UIT.T, config = {text = "Artists:", scale = 0.5, colour = G.C.MULT}},
    }},
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n = G.UIT.T, config = {text = "some sprites had to be made either for consistency or", scale = 0.3, colour = G.C.WHITE}},
    }},
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n = G.UIT.T, config = {text = "because we didn't have the full quality version", scale = 0.3, colour = G.C.WHITE}},
    }},
    {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
        {n = G.UIT.T, config = {text = "Diet Cola for Unused Joker Sprites pack", scale = 0.35, colour = G.C.WHITE}},
    }},
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n = G.UIT.T, config = {text = "and secret planets for Old Planets pack:", scale = 0.35, colour = G.C.WHITE}},
    }},
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n = G.UIT.T, config = {text = "ArgilRants", juice = true, scale = 0.4, colour = G.C.CHIPS}},
    }},
    {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
        {n = G.UIT.T, config = {text = "Mod icon and The A, Obelisk and Oops! All 6s for", scale = 0.35, colour = G.C.WHITE}},
    }},
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n = G.UIT.T, config = {text = "Unused Joker Sprites pack:", scale = 0.35, colour = G.C.WHITE}},
    }},
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n = G.UIT.T, config = {text = "zebragoboom", juice = true, scale = 0.4, colour = G.C.MULT}},
    }},
    {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
        {n = G.UIT.T, config = {text = "Bloodstone for Unused Joker Sprites pack: ", scale = 0.35, colour = G.C.WHITE}},
    }},
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n = G.UIT.T, config = {text = "januarydomino", juice = true, scale = 0.4, colour = HEX("8597c1ff"), tooltip = {title = "Check out", text = {"Jandolatro", "aka. Debuffed Steel Blue Seal Polychrome 9 of Clubs", "[coming soon]"}}}},
    }},
}}
end

mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { align = "cm", padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK},
        nodes = {
            {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                {n = G.UIT.T, config = {text = "REQUIRES RESTART:", scale = 0.5, colour = G.C.RED}},
            }},
            {
                n = G.UIT.R,
                config = { align = "cm", padding = 0 },
                nodes = {
                    create_toggle{
                        label = "Classic Negative Shader",
                        ref_table = mod.config,
                        ref_value = 'classic_negative_shader',
                    }
                }
            },
            {
                n = G.UIT.R,
                config = { align = "cm", padding = 0 },
                nodes = {
                    create_toggle{
                        label = "Classic Debuff Shader",
                        ref_table = mod.config,
                        ref_value = 'classic_debuff_shader',
                    }
                }
            }
        }
    }
end


if mod.config.classic_negative_shader == true then
    SMODS.Shader{
        key = 'negative',
        path = 'negative.fs',
        prefix_config = { key = false },
    }
end

if mod.config.classic_debuff_shader == true then
    SMODS.Shader{
        key = 'debuff',
        path = 'debuff.fs',
        prefix_config = { key = false },
    }
end


mod.ui_config = {
 colour = G.C.L_BLACK, 
 author_colour = G.C.CHIPS, 
 bg_colour = { G.C.GREY[1], G.C.GREY[2], G.C.GREY[3], 0.5 }, 
 back_colour = G.C.RED, 
 tab_button_colour = G.C.RED, 
}

mod.description_loc_vars = function(self)
 return {
  scale = 1.2,
  text_colour = G.C.WHITE, 
  background_colour = G.C.CLEAR
 }
end

function tablecontains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

AltTexture{
    key = 'pluto',
    set = 'Planet',
    path = 'pluto.png',
    keys = {'c_pluto'},
	localization = true,
}

AltTexture{
    key = 'mercury',
    set = 'Planet',
    path = 'mercury.png',
    keys = {'c_mercury'},
	localization = true
}

AltTexture{
    key = 'uranus',
    set = 'Planet',
    path = 'uranus.png',
    keys = {'c_uranus'},
	localization = true
}

AltTexture{
    key = 'venus',
    set = 'Planet',
    path = 'venus.png',
    keys = {'c_venus'},
	localization = true
}

AltTexture{
    key = 'saturn',
    set = 'Planet',
    path = 'saturn.png',
    keys = {'c_saturn'},
	localization = true
}

AltTexture{
    key = 'jupiter',
    set = 'Planet',
    path = 'jupiter.png',
    keys = {'c_jupiter'},
	localization = true
}

AltTexture{
    key = 'earth',
    set = 'Planet',
    path = 'earth.png',
    keys = {'c_earth'},
	localization = true
}

AltTexture{
    key = 'mars',
    set = 'Planet',
    path = 'mars.png',
    keys = {'c_mars'},
	localization = true
}

AltTexture{
    key = 'neptune',
    set = 'Planet',
    path = 'neptune.png',
    keys = {'c_neptune'},
	localization = true
}

AltTexture{
    key = 'planet_x',
    set = 'Planet',
    path = 'planet_x.png',
    keys = {'c_planet_x'},
	localization = true
}

AltTexture{
    key = 'ceres',
    set = 'Planet',
    path = 'ceres.png',
    keys = {'c_ceres'},
	localization = true
}

AltTexture{
    key = 'eris',
    set = 'Planet',
    path = 'eris.png',
    keys = {'c_eris'},
	localization = true
}

AltTexture{
    key = 'astronomer',
    set = 'Joker',
    path = 'astronomer.png',
    keys = {'j_astronomer'},
	localization = true
}

AltTexture{
    key = 'stake',
    set = 'Stake',
    path = 'stake.png',
	stickers = true,
	original_sheet = true,
}

AltTexture{
    key = 'scholar',
    set = 'Joker',
    path = 'the_a.png',
    keys = {'j_scholar'},
	localization = true
}

AltTexture{
    key = 'diet_cola',
    set = 'Joker', 
    path = 'diet_cola.png',
    keys = {'j_diet_cola'},
	localization = true
}

AltTexture{
    key = 'invisible',
    set = 'Joker', 
    path = 'invisible.png',
    keys = {'j_invisible'},
	localization = true
}

AltTexture{
    key = 'flash',
    set = 'Joker', 
    path = 'flash.png',
    keys = {'j_flash'},
	localization = true
}

AltTexture{
    key = 'square',
    set = 'Joker', 
    path = 'square.png',
    keys = {'j_square'},
	localization = true,
}

AltTexture{
    key = 'ancient',
    set = 'Joker', 
    path = 'ancient.png',
    keys = {'j_ancient'},
	localization = true,
}

AltTexture{
    key = 'selzer',
    set = 'Joker', 
    path = 'selzer.png',
    keys = {'j_selzer'},
	localization = true,
}

AltTexture{
    key = 'bloodstone',
    set = 'Joker', 
    path = 'bloodstone.png',
    keys = {'j_bloodstone'},
	localization = true,
}

AltTexture{
    key = 'obelisk',
    set = 'Joker', 
    path = 'obelisk.png',
    keys = {'j_obelisk'},
	localization = true,
}

AltTexture{
    key = 'oops',
    set = 'Joker', 
    path = 'oops.png',
    keys = {'j_oops'},
	localization = true,
}

AltTexture{
    key = 'caino',
    set = 'Joker', 
    path = 'caino.png',
    keys = {'j_caino'},
    soul_keys = {'j_caino'},
	localization = true,
}

AltTexture{
    key = '8_ball',
    set = 'Joker', 
    path = '8_ball.png',
    keys = {'j_8_ball'},
	localization = true,
}

AltTexture{
    key = 'arrowhead',
    set = 'Joker', 
    path = 'arrowhead.png',
    keys = {'j_arrowhead'},
	localization = true,
}

AltTexture{
    key = 'blueprint',
    set = 'Joker', 
    path = 'blueprint.png',
    keys = {'j_blueprint'},
	localization = true,
}

AltTexture{
    key = 'ceremonial',
    set = 'Joker', 
    path = 'ceremonial.png',
    keys = {'j_ceremonial'},
	localization = true,
}

AltTexture{
    key = 'oops_borderless',
    set = 'Joker', 
    path = 'oops_borderless.png',
    keys = {'j_oops'},
	localization = true,
}

AltTexture{
    key = 'pareidolia',
    set = 'Joker', 
    path = 'pareidolia.png',
    keys = {'j_pareidolia'},
	localization = true,
}

AltTexture{
    key = 'scary_face',
    set = 'Joker', 
    path = 'scary_face.png',
    keys = {'j_scary_face'},
	localization = true,
}

AltTexture{
    key = 'sock_and_buskin',
    set = 'Joker', 
    path = 'sock_and_buskin.png',
    keys = {'j_sock_and_buskin'},
	localization = true,
}

AltTexture{
    key = 'fortune_teller',
    set = 'Joker', 
    path = 'fortune_teller.png',
    keys = {'j_fortune_teller'},
	localization = true,
}

AltTexture{
    key = 'jolly',
    set = 'Joker', 
    path = 'jolly.png',
    keys = {'j_jolly'},
	localization = true,
}

AltTexture{
    key = 'wrathful',
    set = 'Joker', 
    path = 'wrathful.png',
    keys = {'j_wrathful_joker'},
	localization = true,
}

AltTexture{
    key = 'lusty',
    set = 'Joker', 
    path = 'lusty.png',
    keys = {'j_lusty_joker'},
	localization = true,
}

AltTexture{
    key = 'greedy',
    set = 'Joker', 
    path = 'greedy.png',
    keys = {'j_greedy_joker'},
	localization = true,
}

AltTexture{
    key = 'gluttenous',
    set = 'Joker', 
    path = 'gluttonous.png',
    keys = {'j_gluttenous_joker'},
	localization = true,
}

AltTexture{
    key = 'zany',
    set = 'Joker', 
    path = 'zany.png',
    keys = {'j_zany'},
	localization = true,
}

AltTexture{
    key = 'mad',
    set = 'Joker', 
    path = 'mad.png',
    keys = {'j_mad'},
	localization = true,
}

AltTexture{
    key = 'crazy',
    set = 'Joker', 
    path = 'crazy.png',
    keys = {'j_crazy'},
	localization = true,
}

TexturePack{
    key = 'oldplanets',
    textures = {
        'ctex_earth',
        'ctex_mercury',
		'ctex_uranus',
		'ctex_venus',
		'ctex_saturn',
		'ctex_jupiter',
		'ctex_mars',
		'ctex_neptune',
		'ctex_planet_x',
		'ctex_ceres',
		'ctex_eris',
		'ctex_pluto',
		'ctex_astronomer',
    },
}

TexturePack{
    key = 'starstickers',
    textures = {
		'ctex_stake',
    },
}

TexturePack{
    key = 'unusedjokers',
    textures = {
        'ctex_scholar',
		'ctex_diet_cola',
        'ctex_ancient',
        'ctex_selzer',
        'ctex_bloodstone',
        'ctex_obelisk',
        'ctex_oops',
    },
}

TexturePack{
    key = 'changedjokers',
    textures = {
		'ctex_square',
        'ctex_invisible',
        'ctex_flash',
        'ctex_caino',
        'ctex_8_ball',
        'ctex_arrowhead',
        'ctex_blueprint',
        'ctex_ceremonial',
        'ctex_oops_borderless',
        'ctex_pareidolia',
        'ctex_scary_face',
        'ctex_sock_and_buskin',
        'ctex_fortune_teller',
        'ctex_jolly',
        'ctex_wrathful',
        'ctex_lusty',
        'ctex_greedy',
        'ctex_gluttenous',
        'ctex_zany',
        'ctex_mad',
        'ctex_crazy',
    },
}

-- Thank you LilacLila (github) / LilacLilo (discord) for helping with the badges and most of the code ahead
SMODS.DrawStep {
    key = 'invis_fix',
    order = -9,
    func = function(self, layer)
        if self.ability.name == 'Invisible Joker' and self.ignore_base_shader and self.ignore_base_shader['j_invisible'] then
            local is_negative = self.edition and self.edition.negative and (not self.delay_edition or self.delay_edition.negative)
            if not is_negative and not self.greyed then
                self.children.center:draw_shader('dissolve')
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' }
}


ctex = ctex or {}

function ctex.is_pack_active(check_pack)
    if not (Malverk and Malverk.config and Malverk.config.selected) then return false end
    for _, pack in ipairs(Malverk.config.selected) do
        if pack == check_pack then return true end
    end
    return false
end

ctex.TEXT_CENTERS = {

}

local ref_update_atlas = Malverk.update_atlas
function Malverk.update_atlas(...)
    check()
    if ctex.is_pack_active('texpack_ctex_oldplanets') then
        ctex.OLDPLANETS_TEXT_CENTERS = {
            c_pluto = true,
            c_mercury = true,
            c_uranus = true,
            c_venus = true,
            c_saturn = true,
            c_jupiter = true,
            c_earth = true,
            c_mars = true,
            c_neptune = true,
            c_planet_x = true,
            c_ceres = true,
            c_eris = true,
            j_astronomer = true,
        }
    else
        ctex.OLDPLANETS_TEXT_CENTERS = {

        }
    end

    if ctex.is_pack_active('texpack_ctex_unusedjokers') then
        ctex.UNUSEDJOKERS_TEXT_CENTERS = {
            j_scholar = true,
		    j_diet_cola = true,
            ctex_ancient = true,
            j_selzer = true,
            j_bloodstone = true,
            j_obelisk = true,
            j_oops = true,
        }
    else
        ctex.UNUSEDJOKERS_TEXT_CENTERS = {

        }
    end

    if ctex.is_pack_active('texpack_ctex_changedjokers') then
        ctex.CHANGEDJOKERS_TEXT_CENTERS = {
            j_flash = true,
            j_invisible = true,
            j_square = true,
            j_caino = true,
            j_8_ball = true,
            j_arrowhead = true,
            j_blueprint = true,
            j_ceremonial = true,
            j_oops = true,
            j_pareidolia = true,
            j_scary_face = true,
            j_sock_and_buskin = true,
            j_fortune_teller = true,
            j_jolly = true,
            j_wrathful_joker = true,
            j_lusty_joker = true,
            j_greedy_joker = true,
            j_gluttenous_joker = true,
            j_zany = true,
            j_mad = true,
            j_crazy = true,
        }


    else
        ctex.CHANGEDJOKERS_TEXT_CENTERS = {

        }

    end

    return ref_update_atlas(...)
end


function ctex.is_affected(card)
    if not card then return false end

    if card.edition and card.edition.polychrome then
        return false
    end

    local center = card.config and card.config.center
    local key = center and center.key
    if not key then return false end
    if ctex.TEXT_CENTERS[key] then return true end
    if ctex.OLDPLANETS_TEXT_CENTERS[key] then return true end
    if ctex.UNUSEDJOKERS_TEXT_CENTERS[key] then return true end
    if ctex.CHANGEDJOKERS_TEXT_CENTERS[key] then return true end
    return false
end

function ctex.create_badge()
    local badge = create_badge(localize('k_ctex'), 	G.C.GOLD, G.C.WHITE, 0.8)
    return badge
end

local ref_card_h_popup = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
    ctex.popup_card = card
    local ret = ref_card_h_popup(card)
    ctex.popup_card = nil
    return ret
end

if SMODS.create_mod_badges then
    local ref_create_mod_badges = SMODS.create_mod_badges
    function SMODS.create_mod_badges(obj, badges)
        ref_create_mod_badges(obj, badges)
        local card = ctex.popup_card
        if card and obj and obj == (card.config and card.config.center) and ctex.is_affected(card) then
            badges[#badges + 1] = ctex.create_badge()
        end
    end
end

function check()
    if ctex.is_pack_active('texpack_ctex_changedjokers') then
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
end

SMODS.Joker:take_ownership('invisible', {
set_sprites = function(self, card, front)
    card.ignore_base_shader = card.ignore_base_shader or {}
    if ctex.is_pack_active('texpack_ctex_changedjokers') then
        card.ignore_base_shader['j_invisible'] = true
    else 
        card.ignore_base_shader['j_invisible'] = nil
    end
end
},
true
)

check()