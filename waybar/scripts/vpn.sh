#!/bin/sh

STATUS=$(vpn status)

if [ "$STATUS" = "VPN is running" ]; then
    OPTIONS="Turn Off"
else
    OPTIONS="Turn On"
fi

#OPTIONS="Vonnue VPN"
#
#CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "Select")
#
#case "$CHOICE" in
#    "Vonnue VPN")
#        footclient --app-id floating_shell --window-size-chars 82x25 -e bash -c "sudo ~/.config/sway/core/scripts/charge-limiter.sh -m > ~/.local/state/charge-limiter.state"
#        notify-send "Charge Mode" "$(cat ~/.local/state/charge-limiter.state)"
#        ;;
#    *)
#        if [ -n "$CHOICE" ]; then
#         notify-send "Charge Mode" "Invalid option"
#        fi
#        ;;
#esac

