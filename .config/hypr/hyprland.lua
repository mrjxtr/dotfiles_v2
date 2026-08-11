--  _   _                  _                 _
-- | | | |_   _ _ __  _ __| | __ _ _ __   __| |
-- | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
-- |  _  | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|
--
-- Lua config entry point (ported from hyprland.conf).
-- All required files share one global Lua environment, so globals set in
-- colors.lua are visible everywhere.

-- Helpers (load_variant)
require("functions")

-- Monitor
require("conf.monitor")

-- Cursor
require("conf.cursor")

-- Environment
require("conf.environment")

-- Keyboard
require("conf.keyboard")

-- Matugen color file (globals: background, on_surface, ...)
require("colors")
color8 = on_primary_fixed
color11 = on_surface

-- Autostart
require("conf.autostart")

-- Configuration files
require("conf.window")
require("conf.decoration")
require("conf.layout")
require("conf.workspace")
require("conf.misc")
require("conf.keybinding")
require("conf.windowrule")

-- Animation
require("conf.animation")

-- ML4W configuration
require("conf.ml4w")

-- Custom
require("conf.custom")
