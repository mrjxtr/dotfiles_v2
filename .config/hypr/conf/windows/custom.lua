-- General window layout and colors
-- name: "Custom"

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 2,
        border_size = 1,
        col = {
            -- baked in from the old ml4w hyprctl.json overrides, which can't
            -- apply anymore (hyprctl keyword is dead under the lua config)
            active_border = "rgba(241f31ff)",
            inactive_border = "rgba(000000ff)",
            -- matugen-dynamic alternative:
            -- active_border = color11, -- from colors.lua
        },
        layout = "dwindle",
        resize_on_border = true,
    },
})
