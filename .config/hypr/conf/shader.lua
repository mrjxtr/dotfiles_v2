-- Screen shader. The active shader lives in conf/shade_state.lua (written by
-- scripts/hyprshade.sh), so toggling is a state write + hyprctl reload.
-- A real config reload runs the same apply path the old `hyprctl keyword`
-- did, which screen shaders need to render without flicker/artifacts.
local home = os.getenv and os.getenv("HOME") or "/home/mrjxtr"
-- pcall so a missing state file (fresh clone) just means shader off
local ok, shade = pcall(require, "conf.shade_state")
if ok and type(shade) == "string" and shade ~= "" then
    hl.config({ decoration = { screen_shader = home .. "/.config/hypr/shaders/" .. shade .. ".glsl" } })
end
