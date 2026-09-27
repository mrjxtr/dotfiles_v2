-- Monitor setup
-- name: "Work"

hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "0x1920",
    scale = 1.5,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "auto",
    scale = 1,
})
