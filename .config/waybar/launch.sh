#!/bin/bash
#                    __
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/
#            /___/
#
# -----------------------------------------------------
# Serialize this script: concurrent runs (boot race, keybind spam)
# wait their turn instead of each spawning their own waybar
# -----------------------------------------------------
exec 200>"$XDG_RUNTIME_DIR/waybar-launch.lock"
flock -w 15 200 || exit 1

# -----------------------------------------------------
# Quit all running waybar instances and wait until they're gone
# -----------------------------------------------------
killall waybar 2>/dev/null
for _ in $(seq 1 20); do
    pgrep -x waybar >/dev/null || break
    sleep 0.2
done
# still alive after 4s? force it
pgrep -x waybar >/dev/null && killall -9 waybar 2>/dev/null
sleep 0.2

# -----------------------------------------------------
# Default theme: /THEMEFOLDER;/VARIATION
# -----------------------------------------------------
themestyle="/ml4w-modern;/ml4w-modern/light"

# -----------------------------------------------------
# Get current theme information from ~/.config/ml4w/settings/waybar-theme.sh
# -----------------------------------------------------
if [ -f ~/.config/ml4w/settings/waybar-theme.sh ]; then
    themestyle=$(cat ~/.config/ml4w/settings/waybar-theme.sh)
else
    touch ~/.config/ml4w/settings/waybar-theme.sh
    echo "$themestyle" >~/.config/ml4w/settings/waybar-theme.sh
fi

IFS=';' read -ra arrThemes <<<"$themestyle"
echo ":: Theme: ${arrThemes[0]}"

if [ ! -f ~/.config/waybar/themes${arrThemes[1]}/style.css ]; then
    themestyle="/ml4w;/ml4w/light"
fi

# -----------------------------------------------------
# Loading the configuration
# -----------------------------------------------------
config_file="config"
style_file="style.css"

# Standard files can be overwritten with an existing config-custom or style-custom.css
if [ -f ~/.config/waybar/themes${arrThemes[0]}/config-custom ]; then
    config_file="config-custom"
fi
if [ -f ~/.config/waybar/themes${arrThemes[1]}/style-custom.css ]; then
    style_file="style-custom.css"
fi

# Check if waybar-disabled file exists
if [ ! -f $HOME/.config/ml4w/settings/waybar-disabled ]; then
    # 200>&- closes the lock fd so waybar doesn't inherit it and hold the lock forever
    waybar -c ~/.config/waybar/themes${arrThemes[0]}/$config_file -s ~/.config/waybar/themes${arrThemes[1]}/$style_file 200>&- &
else
    echo ":: Waybar disabled"
fi
