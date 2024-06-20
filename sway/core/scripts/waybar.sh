#!/usr/bin/env bash
# wrapper script for waybar with args, see https://github.com/swaywm/sway/issues/5724

USER_CONFIG=~/.config/waybar/config.jsonc
USER_STYLE=~/.config/waybar/style.css

waybar -c "${USER_CONFIG}" -s "${USER_STYLE}" > $(mktemp -t XXXX.waybar.log)
