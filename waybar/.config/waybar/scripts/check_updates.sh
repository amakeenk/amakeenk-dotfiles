#!/bin/bash

while ! ping -c 1 8.8.8.8 &>/dev/null; do
    sleep 5
done

shopt -s expand_aliases
source ~/.bashrc

clean_old_tasks 2>&1 >/dev/null && \
sudo apt-get update 2>&1 >/dev/null && \
UPDATES_COUNT=$(sudo apt-get dist-upgrade --dry-run 2>&1 | grep 'будет обновлено' | cut -d' ' -f1)

echo $UPDATES_COUNT

if [ "$UPDATES_COUNT" -ne 0 ]; then
    notify-send --expire-time=5000 "Доступны обновления пакетов" "Количество пакетов для обновления: ${UPDATES_COUNT}"
else
    notify-send --expire-time=3000 "Доступных обновлений пакетов нет"
fi
