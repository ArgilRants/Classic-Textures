local mod = SMODS.current_mod

-- Create credits Jokers.
SMODS.Atlas({
    key = "argil",
    path = "argil.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "lilo",
    path = "lilo.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "zebra",
    path = "zebra.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "jandom",
    path = "jandom.png",
    px = 71,
    py = 95
})

SMODS.Joker{
	key = "argil",
	rarity = 4,
	pos = { x = 0, y = 0 },
    soul_pos = {x = 1, y = 0},
	atlas = "argil",
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = false,
	no_collection = true,
    no_mod_badges = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                elements = {
                    { n=G.UIT.R, config = { align="cm" }, nodes = {
                        { n=G.UIT.O, config= { object =
                            SMODS.create_card{key = "j_ctex_zebra", area = G.title_top, no_edition = true, scale = {w = 0.7, h = 0.7}}
                        }},
                    } },
                }
            },
        }
	end,

	calculate = function(self, card, context) end,
	in_pool = function(self)
		return false
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_ctex_creator'), G.C.CTEX_CREATOR, G.C.WHITE, 1)
    end,
}

SMODS.Joker{
	key = "lilo",
	rarity = 3,
	pos = { x = 0, y = 0 },
	atlas = "lilo",
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = false,
	no_collection = true,
    no_mod_badges = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                elements = {
                    { n=G.UIT.R, config = { align="cm" }, nodes = {
                        { n=G.UIT.O, config= { object =
                            SMODS.create_card{key = "j_ctex_zebra", area = G.title_top, no_edition = true, scale = {w = 0.7, h = 0.7}}
                        }},
                    } },
                }
            },
        }
	end,

	calculate = function(self, card, context) end,
	in_pool = function(self)
		return false
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_ctex_developer'), G.C.BLUE, G.C.WHITE, 1)
    end,
}

SMODS.Joker{
	key = "zebra",
	rarity = 4,
	pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
	atlas = "zebra",
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = false,
	no_collection = true,
    no_mod_badges = true,

	calculate = function(self, card, context) end,
	in_pool = function(self)
		return false
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_ctex_artist'), G.C.RED, G.C.WHITE, 1)
    end,
}

SMODS.Joker{
	key = "jandom",
	rarity = 4,
	pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
	atlas = "jandom",
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = false,
	no_collection = true,
    no_mod_badges = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {          
                elements = {
                    { n=G.UIT.R, config = {align="cm"}, nodes = {
                        { n=G.UIT.O, config= {object =
                            create_janadlatro()
                        }},
                    } },
                }
            },
        }
	end,

	calculate = function(self, card, context) end,
	in_pool = function(self)
		return false
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_ctex_artist'), G.C.RED, G.C.WHITE, 1)
    end,
}

-- End of create credit jokers

-- Create credits tab

classic_textures.credits_tab = function()
 return {n = G.UIT.ROOT, config = {align = "tm", minh=0.5, minw=10, padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK}, 
 nodes = {
    {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
            {n = G.UIT.T, config = {text = "Classic Textures ", colour = G.C.EDITION, scale = 0.5}},
            {n = G.UIT.T, config = {text = "was created by:", colour = G.C.UI.TEXT_LIGHT, scale = 0.5}},
    }},
    {n=G.UIT.R, config={align = "cm", padding = 0.5, colour = darken(G.C.BLACK, 0.2), emboss = 0.05, r = 0.1}, nodes={
        {n = G.UIT.O, config = {object=create_credits()}},
    }},
    {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
        {n = G.UIT.T, config = {text = "[Hover over the Jokers for more info]", colour = HEX("ffffff80"), scale = 0.4}},
    }},
}}
end