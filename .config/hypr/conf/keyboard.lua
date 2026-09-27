-- Keyboard and touchpad input
-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        numlock_by_default = true,
        mouse_refocus = false,

        follow_mouse = 1,
        touchpad = {
            -- laptop settings (desktop would want natural_scroll = false)
            natural_scroll = true,
            middle_button_emulation = true,
            clickfinger_behavior = false,
            scroll_factor = 1.0,
        },
        sensitivity = 0, -- pointer speed: -1.0 to 1.0, 0 means no modification
    },
})
