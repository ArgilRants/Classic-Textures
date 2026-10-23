-- This might not be the best way to fix this issue, but I don't really have any other ideas right now
if SMODS.find_mod("blueprint") then
    G.FUNCS.your_collection = function(e)
        G.FUNCS.textures_button()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu{
            definition = create_UIBox_your_collection(),
        }
    end

    G.FUNCS.exit_overlay_menu = function()
        G.FUNCS.textures_button()
        if not G.OVERLAY_MENU then return end
        G.CONTROLLER.locks.frame_set = true
        G.CONTROLLER.locks.frame = true
        G.CONTROLLER:mod_cursor_context_layer(-1000)
        G.OVERLAY_MENU:remove()
        G.OVERLAY_MENU = nil
        G.VIEWING_DECK = nil
        G.SETTINGS.paused = false

        --Save settings to file
        G:save_settings()
    end 
end