-- General window layout and colors
-- name: "Custom"

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 2,
        border_size = 1,
        col = {
            active_border = color11, -- from colors.lua (matugen)
            inactive_border = "rgba(ffffffff)",
        },
        layout = "dwindle",
        resize_on_border = true,
    },
})
