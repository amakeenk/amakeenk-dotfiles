#!/bin/bash

WALLPAPER_PATH="${HOME}/.config/hypr/images/wallpaper.jpg"
NEW_WALLPAPER_PATH="$(zenity --file-selection)"

cp -f "${NEW_WALLPAPER_PATH}" "${WALLPAPER_PATH}"

killall hyprpaper && hyprpaper &
