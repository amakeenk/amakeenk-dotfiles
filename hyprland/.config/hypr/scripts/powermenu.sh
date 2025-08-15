#!/bin/bash

choice=$(echo -e "󰐥 Shutdown\n󰜉 Reboot\n󰍃 Logout\n󰌾 Lock\n󰤄 Sleep" | walker --dmenu --hidebar)
case "$choice" in
  "󰐥 Shutdown") systemctl poweroff ;;
  "󰜉 Reboot") systemctl reboot ;;
  "󰍃 Logout") hyprctl dispatch exit ;;
  "󰌾 Lock") hyprlock ;;
  "󰤄 Sleep") systemctl suspend ;;
esac
