-- Screen shader. The active shader lives in conf/shade_state.lua, written
-- by scripts/hyprshade.sh (see there for why it works via config reload).
local home = os.getenv and os.getenv("HOME") or "/home/mrjxtr"
-- pcall so a missing state file (fresh clone) just means shader off
local ok, shade = pcall(require, "conf.shade_state")
if ok and type(shade) == "string" and shade ~= "" then
    hl.config({ decoration = { screen_shader = home .. "/.config/hypr/shaders/" .. shade .. ".glsl" } })
end
