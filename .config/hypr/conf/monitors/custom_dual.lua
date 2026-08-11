-- Monitor setup
-- name: "Dual Monitors"

hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "auto",
    scale = 1.2,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@120",
    position = "1920x0",
    scale = 1,
})
