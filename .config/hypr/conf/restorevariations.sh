#!/bin/bash
clear
cat <<"EOF"
   ___          __
  / _ \___ ___ / /____  _______
 / , _/ -_|_-</ __/ _ \/ __/ -_)
/_/|_|\__/___/\__/\___/_/  \__/

EOF
echo "You can restore all variation selectors to the default variations."
echo "PLEASE NOTE: Your customized variation files will not be overwritten or deleted."

restore() {
    # Writes a lua selector file pointing at the default variation,
    # e.g. restore keybinding keybindings
    local selector=$1 category=$2
    if [ ! -f ~/.config/hypr/conf/$category/default.lua ]; then
        echo "Skipped $selector: no $category/default.lua ported yet"
        return
    fi
    {
        echo "-- ${selector^} variation selector"
        echo "load_variant(\"default.lua\", \"$category\")"
    } >~/.config/hypr/conf/$selector.lua
    echo "Hyprland $selector.lua restored!"
}

if gum confirm "Do you want to restore all variations to the default values?"; then
    echo
    restore keybinding keybindings
    restore environment environments
    restore windowrule windowrules
    restore animation animations
    restore decoration decorations
    restore window windows
    restore monitor monitors
    echo
    echo ":: Restore done! Reload with: hyprctl reload"
else
    echo ":: Restore canceled!"
    exit
fi
