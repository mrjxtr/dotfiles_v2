w_margin=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height * 27 / (.scale * 100) | floor')
wlogout -b 5 -T "$w_margin" -B "$w_margin"
