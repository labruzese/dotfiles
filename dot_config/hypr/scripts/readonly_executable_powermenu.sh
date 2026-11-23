#!/bin/bash

if ! killall wofi 2>/dev/null; then
  :
fi

options="Sleep\nReboot\nShutdown\nLogout"

selected=$(echo -e "$options" | wofi --dmenu)

case $selected in
    "Sleep")
        systemctl suspend
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Logout")
	hyprshutdown -t 'Shutting down Hyprland session'
        ;;
esac
