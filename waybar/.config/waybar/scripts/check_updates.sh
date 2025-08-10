#!/bin/bash

shopt -s expand_aliases
source ~/.bashrc

clean_old_tasks 2>&1 >/dev/null && \
sudo apt-get update 2>&1 >/dev/null && \
sudo apt-get dist-upgrade --dry-run 2>&1 | grep 'будет обновлено' | cut -d' ' -f1
