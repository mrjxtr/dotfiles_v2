-- General window decoration
-- name: "Default"

hl.config({
    decoration = {
        rounding = 5, -- was 10 in the .conf, but the ml4w override always set 5
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        fullscreen_opacity = 1.0,

        blur = {
            enabled = true,
            size = 6,
            passes = 2,
            new_optimizations = true,
            ignore_opacity = true,
            xray = true,
        },

        shadow = {
            enabled = true,
            range = 30,
            render_power = 3,
            color = "rgba(00000066)",
        },
    },
})

-- was: blurls = waybar (commented out in the .conf too)
-- hl.layer_rule({ name = "blur-waybar", match = { namespace = "waybar" }, blur = true })
