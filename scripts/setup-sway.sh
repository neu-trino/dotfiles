#!/usr/bin/env bash

expand_home() {
    echo "${1//\$HOME/$HOME}"
}

CONFIG_PATH="$(expand_home $(jq -r '.sway.configPath' ./manifest.json))"
HOME_PATH_PLACEHOLDER="$(jq -r '.sway.homePathPlaceholder' ./manifest.json)"

echo "Changing sway conf_dir"
sed -i "s|$HOME_PATH_PLACEHOLDER|$HOME|g" $CONFIG_PATH
