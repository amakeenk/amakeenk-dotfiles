#!/bin/bash

# Проверяем, есть ли активные плееры
players=$(playerctl --list-all 2>/dev/null)

if [ -z "$players" ]; then
    # Нет активных плееров - скрываем кнопки
    echo '{"text": "", "class": "hidden", "tooltip": ""}'
else
    # Есть активные плееры - показываем кнопки
    action=$1
    if [ "$action" = "prev" ]; then
        echo '{"text": "⏮", "class": "visible", "tooltip": "Previous track"}'
    elif [ "$action" = "next" ]; then
        echo '{"text": "⏭", "class": "visible", "tooltip": "Next track"}'
    else
        echo '{"text": "", "class": "hidden", "tooltip": ""}'
    fi
fi