#!/usr/bin/env bash

echo "Setting up sway"
. ./setup-sway.sh
echo "Sway setup completed"

echo

echo "Setting up zsh"
. ./setup-zsh.sh
echo "zsh setup completed"

echo

echo "Setting up swww"
. ./setup-swww.sh
echo "swww setup completed"

echo 

echo "All setups completed"
