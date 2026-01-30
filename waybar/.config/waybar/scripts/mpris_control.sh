#!/bin/bash

# Скрипт для управления воспроизведением через MPRIS с различными действиями
action=$1

case $action in
    "play-pause")
        playerctl play-pause
        ;;
    "next")
        playerctl next
        ;;
    "previous")
        playerctl previous
        ;;
    *)
        echo "Usage: $0 {play-pause|next|previous}"
        exit 1
        ;;
esac