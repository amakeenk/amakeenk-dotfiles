#!/bin/bash

config_src="${PWD}/conky.conf"
config_dst="${HOME}/.conkyrc"

service_src="${PWD}/conky.service"
service_dst="/usr/lib/systemd/user/conky.service"

iface="$(ip link | grep 'state UP' | cut -d':' -f2 | tr -d ' ')"

echo "Install conky if not installed"
rpm -q conky >/dev/null || sudo apt-get install -y conky

echo "Copy config to ${config_dst}"
\cp ${config_src} ${config_dst}

echo "Set iface name in config"
sed -i "s/IFACE_NAME/${iface}/g" ${config_dst}

echo "Install systemd service"
sudo cp ${service_src} ${service_dst}
systemctl --user daemon-reload
systemctl enable --user conky.service

echo "Start conky.service"
systemctl restart --user conky.service
sleep 1
systemctl status --user conky.service

