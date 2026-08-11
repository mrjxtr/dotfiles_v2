-- ------------------------ --
-- Additional customization --
-- ------------------------ --

-- Autostart applications (disabled, kept for reference)
-- Sequenced startup: discord -> slack -> obsidian -> spotify -> firefox -> kitty
-- The original exec-once chains from custom.conf can be recreated here inside
-- an hl.on("hyprland.start", ...) block with hl.exec_cmd(...) calls, e.g.:
--
-- hl.on("hyprland.start", function()
--     hl.exec_cmd([[while ! pgrep -x waybar > /dev/null; do sleep 1; done; ...]])
-- end)

-- Disable auto lock by default
-- hl.on("hyprland.start", function()
--     hl.exec_cmd("~/.config/hypr/scripts/hypridle.sh toggle")
-- end)
