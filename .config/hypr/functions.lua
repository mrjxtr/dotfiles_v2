--    ____                 __  _
--   / __/_  ______  _____/ /_(_)___  ____  _____
--  / /_/ / / / __ \/ ___/ __/ / __ \/ __ \/ ___/
-- / __/ /_/ / / / / /__/ /_/ / /_/ / / / (__  )
-- /_/  \__,_/_/ /_/\___/\__/_/\____/_/ /_/____/
--
-- Shared helpers, loaded first from hyprland.lua.

function load_variant(variant_file, category)
    -- Loads a config variation, e.g. load_variant("custom_dual.lua", "monitors")
    -- requires conf/monitors/custom_dual.lua. The selector files under conf/
    -- hold a single call to this so switching variations stays a one-line edit.
    variant_file = variant_file:gsub("%.lua$", "")
    require("conf." .. category .. "." .. variant_file)
end
