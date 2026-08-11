-- Environment variables
-- name: "Custom"

-- Custom settings in ml4w.lua

-- NVIDIA https://wiki.hypr.land/Nvidia/
-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- hl.env("__GL_VRR_ALLOWED", "1")
-- hl.env("WLR_DRM_NO_ATOMIC", "1")
-- hl.env("NVD_BACKEND", "direct")
-- hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- SDL version
hl.env("SDL_VIDEODRIVER", "wayland")
-- hl.env("SDL_VIDEODRIVER", "x11")

-- Cursor theme at launch (avoids default X cursor until first hover)
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    cursor = {
        no_hardware_cursors = true,
        -- default_monitor = "HDMI-A-1",
    },

    -- render = {
    --     direct_scanout = 2,
    -- },

    -- opengl = {
    --     nvidia_anti_flicker = false,
    -- },

    -- misc = {
    --     vrr = 0,
    -- },

    -- debug = {
    --     damage_tracking = 0,
    -- },

    input = {
        repeat_delay = 250,
        repeat_rate = 50,
        accel_profile = "flat",
    },

    xwayland = {
        force_zero_scaling = true,
    },
})
