#!/bin/sh

OPTIONS="Max lifespan (60%)\nBalanced (80%)\nFull (100%)"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "Select")

case "$CHOICE" in
    "Max lifespan (60%)")
        footclient --app-id floating_shell --window-size-chars 82x25 -e bash -c "sudo ~/.config/sway/core/scripts/charge-limiter.sh -m > ~/.local/state/charge-limiter.state"
        notify-send "Charge Mode" "$(cat ~/.local/state/charge-limiter.state)"
        ;;
    "Balanced (80%)")
        footclient --app-id floating_shell --window-size-chars 82x25 -e bash -c "sudo ~/.config/sway/core/scripts/charge-limiter.sh -b > ~/.local/state/charge-limiter.state"
        notify-send "Charge Mode" "$(cat ~/.local/state/charge-limiter.state)"
        ;;
    "Full (100%)")
        footclient --app-id floating_shell --window-size-chars 82x25 -e bash -c "sudo ~/.config/sway/core/scripts/charge-limiter.sh -f > ~/.local/state/charge-limiter.state"
        notify-send "Charge Mode" "$(cat ~/.local/state/charge-limiter.state)"
        ;;
    *)
        if [ -n "$CHOICE" ]; then
         notify-send "Charge Mode" "Invalid option"
        fi
        ;;
esac

