#!/bin/bash
#     _    _ _  __ _             _
#    / \  | | |/ _| | ___   __ _| |_
#   / _ \ | | | |_| |/ _ \ / _` | __|
#  / ___ \| | |  _| | (_) | (_| | |_
# /_/   \_\_|_|_| |_|\___/ \__,_|\__|
#

# workspaceopt was deprecated with the lua config, toggle each window instead
ws_id=$(hyprctl activeworkspace -j | jq -r '.id')
for addr in $(hyprctl clients -j | jq -r --argjson ws "$ws_id" '.[] | select(.workspace.id == $ws) | .address'); do
    hyprctl dispatch "hl.dsp.window.float({ action = \"toggle\", window = \"address:$addr\" })"
done
notify-send "Windows on this workspace toggled to floating/tiling"
