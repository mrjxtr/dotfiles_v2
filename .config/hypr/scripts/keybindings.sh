#!/bin/bash
#  _              _     _           _ _
# | | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___
# | |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|
# |   <  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
# |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
#           |___/                             |___/
#
# Rofi keybind cheatsheet built from the live compositor state (hyprctl binds),
# no config parsing. Binds need a description option to show up here.

hyprctl binds -j | jq -c '.[] | select(.description != "")' | awk '
BEGIN {
    # modifier bits from libxkbcommon
    mod_map[64] = "SUPER"
    mod_map[8]  = "ALT"
    mod_map[4]  = "CTRL"
    mod_map[1]  = "SHIFT"
}
{
    match($0, /"modmask":([0-9]+)/, m)
    modmask = m[1]

    match($0, /"key":"([^"]+)"/, k)
    key = toupper(k[1])

    match($0, /"description":"([^"]+)"/, d)
    desc = d[1]

    # rebuild modifier names from the mask
    mods = ""
    for (bit in mod_map) {
        if (and(modmask, bit)) {
            mods = (mods == "" ? mod_map[bit] : mods " + " mod_map[bit])
        }
    }

    if (mods != "" && key != "") {
        combo = mods " + " key
    } else {
        combo = (mods != "" ? mods : key)
    }

    printf "%s\r%s\n", combo, desc
}' | rofi -dmenu -i -markup -eh 2 -replace -p "Keybinds" -config ~/.config/rofi/config-compact.rasi
