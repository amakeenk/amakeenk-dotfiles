#!/bin/bash

direction=$1
ddcutil setvcp 10 $direction 5
cur_value=$(ddcutil getvcp 10 --brief | cut -d' ' -f4)
notify-send --expire-time=1000 --print-id "Яркость монитора изменена" "Текущая яркость: ${cur_value}"
