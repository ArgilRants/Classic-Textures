classic_textures.config = classic_textures.config or {}
if classic_textures.config.classic_negative_shader == nil then classic_textures.config.classic_negative_shader = false end
if classic_textures.config.classic_debuff_shader == nil then classic_textures.config.classic_debuff_shader = false end
if classic_textures.config.bordered_sin_jokers == nil then classic_textures.config.bordered_sin_jokers = false end
G.classic_textures_config = classic_textures.config_tab

classic_textures.ui_config = {
 colour = G.C.L_BLACK, 
 author_colour = G.C.CTEX_CREATOR, 
 bg_colour = { G.C.GREY[1], G.C.GREY[2], G.C.GREY[3], 0.5 }, 
 back_colour = G.C.RED, 
 tab_button_colour = G.C.RED, 
}

classic_textures.description_loc_vars = function(self)
    return {
    vars = {          
        elements = {
            {n=G.UIT.C, config = {align = "cm", r = 0.1, hover = true, minh = 0.8, shadow = true, colour = HEX("3FC7EB"), minw = 2, button = "textures_button",}, nodes = {
                {n=G.UIT.R, config = {align="cm"}, nodes = {
                    {n=G.UIT.T, config = {align="cm", text = "TEXTURES", scale = 0.4, color = G.C.UI.TEXT_LIGHT}}
                }},
            }},
            {n=G.UIT.C, config = {align = "cm", r = 0.1, hover = true, minh = 0.8, shadow = true, colour = G.C.UI.TEXT_INACTIVE, minw = 2, button = "ctex_github",}, nodes = {
                {n=G.UIT.R, config = {align="cm"}, nodes = {
                    {n=G.UIT.T, config = {align="cm", text = "GITHUB", scale = 0.4, color = G.C.UI.TEXT_LIGHT}}
                }},
            }},
            {n=G.UIT.C, config = {align = "cm", r = 0.1, hover = true, minh = 0.8, shadow = true, colour = HEX("5865F2"), minw = 3, button = "ctex_discord",}, nodes = {
                {n=G.UIT.R, config = {align="cm"}, nodes = {
                    {n=G.UIT.T, config = {align="cm", text = "DISCORD THREAD", scale = 0.4, color = G.C.UI.TEXT_LIGHT}}
                }},
            }},
            {n=G.UIT.C, config = {align = "cm", r = 0.1, hover = true, minh = 0.4, shadow = true, colour = G.C.GOLD, minw = 2, button = "ctex_capture_all",}, nodes = {
                {n=G.UIT.R, config = {align="cm"}, nodes = {
                    {n=G.UIT.T, config = {align="cm", text = "CAPTURE ALL", scale = 0.3, color = G.C.UI.TEXT_LIGHT}}
                }},
            }},
        }
    },
    scale = 1.2,
    text_colour = G.C.WHITE, 
    background_colour = G.C.CLEAR
}
end

classic_textures.set_mod_badge = function(obj)
    return create_badge(localize('k_ctex'), G.C.CTEX_BADGE, G.C.WHITE, 1) 
end

classic_textures.config_tab = function()
    return {n = G.UIT.ROOT, config = {align = "cm", minw=7.5, padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK}, nodes = {
            {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                {n=G.UIT.C, config={minw = 3.75, minh = 1, padding = 0.1}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                        {n = G.UIT.T, config = {text = "Negative Examples:", colour = G.C.UI.TEXT_LIGHT, scale = 0.4}},
                    }},
                    { n=G.UIT.R, config = {align = "cm", padding = 0.05, colour = darken(G.C.BLACK, 0.2), emboss = 0.05, r = 0.1 }, nodes = {
                        { n=G.UIT.O, config= { object =
                            create_negative_examples()
                        }},
                    }},
                    {n = G.UIT.R, config = { align = "cm", padding = 0 },nodes = {
                        create_toggle{
                            label = "Classic Negative",
                            ref_table = classic_textures.config,
                            ref_value = 'classic_negative_shader',
                        },
                    }},
                }},
                {n=G.UIT.C, config={minw = 3.75, minh = 1, padding = 0.1}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                        {n = G.UIT.T, config = {text = "Debuffed Examples:", colour = G.C.UI.TEXT_LIGHT, scale = 0.4}},
                    }},
                    { n=G.UIT.R, config = {align = "cm", padding = 0.05, colour = darken(G.C.BLACK, 0.2), emboss = 0.05, r = 0.1 }, nodes = {
                        { n=G.UIT.O, config= { object =
                            create_debuff_examples()
                        }},
                    }},
                    {n = G.UIT.R, config = {align = "cm", padding = 0},nodes = {
                        create_toggle{
                            label = "Classic Debuff",
                            ref_table = classic_textures.config,
                            ref_value = 'classic_debuff_shader',
                        }
                    }},
                }},
            }},
            {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                    {n = G.UIT.T, config = {text = "Sinful Jokers:", colour = G.C.UI.TEXT_LIGHT, scale = 0.4}},
                }},
                {n=G.UIT.R, config={align = "cm", padding = 0.05, colour = darken(G.C.BLACK, 0.2), emboss = 0.05, r = 0.1}, nodes={
                    {n = G.UIT.O, config = {object=create_sin_jokers()}},
                }},
                {n = G.UIT.R, config = {align = "cm", padding = 0},nodes = {
                    create_toggle{
                        label = "Bordered Sin Jokers",
                        ref_table = classic_textures.config,
                        ref_value = 'bordered_sin_jokers',
                    }
                }},
                {n=G.UIT.R, config={align = "cm"}, nodes={
                    {n = G.UIT.T, config = {text = "[Must have Changed Sprites Pack enabled to take effect]", colour = HEX("ffffff80"), scale = 0.3}},
                }},
            }},
        }
    }
end