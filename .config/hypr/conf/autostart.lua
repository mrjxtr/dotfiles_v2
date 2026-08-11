--    ___       __           __           __
--   / _ |__ __/ /____  ___ / /____ _____/ /_
--  / __ / // / __/ _ \(_-</ __/ _ `/ __/ __/
-- /_/ |_\_,_/\__/\___/___/\__/\_,_/_/  \__/
--
-- Runs once at compositor start (replaces exec-once).

hl.on("hyprland.start", function()
    -- Export env to systemd/dbus for xdg-desktop-portal-hyprland
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Setup XDG for screen sharing and start waypaper and waybar
    hl.exec_cmd("~/.config/hypr/scripts/xdg.sh")

    -- Start Polkit
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

    -- Load wallpaper
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper-restore.sh")

    -- Load notification daemon
    hl.exec_cmd("swaync")

    -- Load GTK settings
    hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")

    -- Using hypridle to start hyprlock
    hl.exec_cmd("hypridle")

    -- Load cliphist history
    hl.exec_cmd("wl-paste --watch cliphist store")

    -- Autostart ML4W app
    hl.exec_cmd("~/.config/ml4w/scripts/ml4w-autostart.sh")

    -- Start autostart cleanup
    hl.exec_cmd("~/.config/hypr/scripts/cleanup.sh")

    -- Dock
    hl.exec_cmd("~/.config/nwg-dock-hyprland/launch.sh")
end)

-- ml4w settings replay, doesn't work under the lua config (its overrides
-- live in windows/custom.lua and decorations/default.lua now)
-- hl.exec_cmd("~/.config/com.ml4w.hyprlandsettings/hyprctl.sh")
