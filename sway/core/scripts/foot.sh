#!/usr/bin/env sh
# wrapper script for foot
#
USER_CONFIG=~/.config/foot/foot.ini

foot -c "${USER_CONFIG}" "$@" &
