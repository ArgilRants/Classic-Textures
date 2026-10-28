-- Add custom shaders
SMODS.Shader{
    key = 'classic_negative',
    path = 'negative.fs',
    prefix_config = { key = false },
}

SMODS.Shader{
    key = 'classic_debuff',
    path = 'debuff.fs',
    prefix_config = { key = false },
}

local ref_draw_shader = Sprite.draw_shader
function Sprite.draw_shader(self, shader, ...)
    if shader == 'negative' and classic_textures.config.classic_negative_shader == true then
        if G.SHADERS['classic_negative'] then
            shader = 'classic_negative'
        end
    end
    return ref_draw_shader(self, shader, ...)
end

local ref_draw_shader = Sprite.draw_shader
function Sprite.draw_shader(self, shader, ...)
    if shader == 'debuff' and classic_textures.config.classic_debuff_shader == true then
        if G.SHADERS['classic_debuff'] then
            shader = 'classic_debuff'
        end
    end
    return ref_draw_shader(self, shader, ...)
end

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

SMODS.DrawStep {
    key = 'soul_fix',
    order = -9,
    func = function(self, layer)
        if self.ability.name == 'The Soul' and self.ignore_base_shader and self.ignore_base_shader['c_soul'] then
            local is_negative = self.edition and self.edition.negative and (not self.delay_edition or self.delay_edition.negative)
            if not is_negative and not self.greyed then
                self.children.center:draw_shader('dissolve')
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' }
}

SMODS.Consumable:take_ownership('soul', {
set_sprites = function(self, card, front)
    card.ignore_base_shader = card.ignore_base_shader or {}
    if ctex.is_pack_active('texpack_ctex_changedsprites') then
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_soul', "c_soul") then
            card.ignore_base_shader['c_soul'] = true
        else 
            card.ignore_base_shader['c_soul'] = nil
        end 
    else 
        card.ignore_base_shader['c_soul'] = nil
    end
end
},
true
)

SMODS.Joker:take_ownership('invisible', {
set_sprites = function(self, card, front)
    card.ignore_base_shader = card.ignore_base_shader or {}
    if ctex.is_pack_active('texpack_ctex_changedsprites') then
        card.ignore_base_shader['j_invisible'] = true
        if ctex.is_texture_active('texpack_ctex_changedsprites', 'alt_tex_ctex_invisible', 'j_invisible') then
            card.ignore_base_shader['j_invisible'] = true
        else 
            card.ignore_base_shader['j_invisible'] = nil
        end 
    else 
        card.ignore_base_shader['j_invisible'] = nil
    end
end
},
true
)