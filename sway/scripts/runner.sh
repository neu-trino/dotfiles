#!/usr/bin/env bash

window-events() {
    swaymsg --type subscribe '["window"]' --monitor &
}

wait-for-window() {
    jq --arg app_id "$1" -n 'inputs
    | if (.change == "new") and (.container.app_id == $app_id)
        then (.container.id, halt)
        else empty
    end'
}

(
    con_id=$(window-events | wait-for-window "$2")
    swaymsg "[con_id=$con_id] move to workspace $1"
) &

${@:3} &
