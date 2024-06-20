#!/usr/bin/env sh
# wrapper script for mako
USER_CONFIG_PATH="${HOME}/.config/mako/config"

mako -c "${USER_CONFIG}" "$@"
