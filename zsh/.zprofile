if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 2 ] ; then
    exec sway --unsupported-gpu
fi
