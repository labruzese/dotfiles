#!/bin/bash

hyprctl dispatch exec "
    wezterm start --class=\"wezterm-overlay\" --workspace clean --always-new-process -- $*
"

echo "$*"
