#!/bin/bash
#  _   _                      _               _
# | | | |_   _ _ __  _ __ ___| |__   __ _  __| | ___
# | |_| | | | | '_ \| '__/ __| '_ \ / _` |/ _` |/ _ \
# |  _  | |_| | |_) | |  \__ \ | | | (_| | (_| |  __/
# |_| |_|\__, | .__/|_|  |___/_| |_|\__,_|\__,_|\___|
#        |___/|_|
#
# Screen shader toggle/selector. The active shader is config state
# (conf/shade_state.lua, read by conf/shader.lua), so toggling is a state
# write + hyprctl reload. A real config reload runs the same apply path the
# old `hyprctl keyword` did under hyprlang, which is what screen shaders
# need to render without flicker or cursor artifacts. Setting the option
# directly via `hyprctl eval` skips that path and glitches.

SHADER_DIR="$HOME/.config/hypr/shaders"
STATE_FILE="$HOME/.config/hypr/conf/shade_state.lua"
LOCK_FILE="${XDG_RUNTIME_DIR:-/tmp}/hyprshade.lock"

# take_lock debounces overlapping runs, extra clicks mid-toggle are dropped
take_lock() {
    exec 9>"$LOCK_FILE"
    flock -n 9 || exit 0
}

# shade_current prints the active shader name, or nothing if off
shade_current() {
    local path
    path=$(hyprctl getoption decoration:screen_shader -j | jq -r '.str // empty')
    # hyprland reports a cleared string option as the literal "[[EMPTY]]"
    [ -n "$path" ] && [ "$path" != "[[EMPTY]]" ] && basename "$path" .glsl
}

# shade_set writes the state module ("" = off) and reloads the config
shade_set() {
    {
        echo '-- Active screen shader name ("" = off). Written by scripts/hyprshade.sh,'
        echo "-- don't edit by hand."
        echo "return \"$1\""
    } >"$STATE_FILE"
    hyprctl reload >/dev/null
}

# shade_on applies a shader by name (without .glsl)
shade_on() {
    if [ ! -f "$SHADER_DIR/$1.glsl" ]; then
        notify-send "Hyprshade error" "shader not found: $1"
        return 1
    fi
    shade_set "$1"
}

# shade_off clears the screen shader
shade_off() {
    shade_set ""
}

if [[ "$1" == "status" ]]; then

    # Print the current shader/damage-tracking state (debug helper)
    echo "shader=$(shade_current) damage_tracking=$(hyprctl getoption debug:damage_tracking -j | jq -r '.int')"

elif [[ "$1" == "rofi" ]]; then

    # Open rofi to select the shader filter for toggle
    options="$(basename -s .glsl -a "$SHADER_DIR"/*.glsl)\noff"

    choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/.config/rofi/config-hyprshade.rasi -i -no-show-icons -l 4 -width 30 -p "Hyprshade")
    if [ ! -z $choice ]; then
        take_lock
        echo "hyprshade_filter=\"$choice\"" >~/.config/ml4w/settings/hyprshade.sh
        if [ "$choice" == "off" ]; then
            shade_off
            notify-send "Hyprshade deactivated"
            echo ":: hyprshade turned off"
        else
            notify-send "Changing Hyprshade to $choice" "Toggle shader with SUPER+CTRL+S"
        fi
    fi

else

    take_lock

    # Toggle the shader based on the selected filter
    hyprshade_filter="blue-light-filter-25"

    # Check if hyprshade.sh settings file exists and load
    if [ -f ~/.config/ml4w/settings/hyprshade.sh ]; then
        source ~/.config/ml4w/settings/hyprshade.sh
    fi
    # old ml4w settings files sometimes have padded values, strip whitespace
    hyprshade_filter="${hyprshade_filter//[[:space:]]/}"

    if [ "$hyprshade_filter" != "off" ]; then
        if [ -z "$(shade_current)" ]; then
            echo ":: shader is not active"
            shade_on "$hyprshade_filter"
            notify-send "Hyprshade activated" "with $hyprshade_filter"
            echo ":: shader started with $hyprshade_filter"
        else
            notify-send "Hyprshade deactivated"
            echo ":: Current shader $(shade_current)"
            echo ":: Switching shader off"
            shade_off
        fi
    else
        shade_off
        echo ":: shader turned off"
    fi

fi
