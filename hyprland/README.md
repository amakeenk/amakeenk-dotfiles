```shell
# apt-get install hyprland \
                  hyprpaper \
                  hyprlock \
                  wlgreet-config-hyprland \
                  hyprland-plugin-hyprexpo \
                  hyprland-plugin-dynamic-cursors \
                  xdg-desktop-portal-hyprland \
                  hyprland-qtutils \
                  kitty \
                  x-cursor-themes-Bibata \
                  wl-clipboard \
                  wlogout \
                  fonts-ttf-fira-code-nerd \
                  fonts-ttf-symbols-nerd \
                  wofi \
                  wlgreet \
                  greetd \
                  papirus-remix-icon-theme \
                  nwg-look \
                  nautilus \
                  gnome-text-editor \
                  loupe \
                  hyprpicker \
                  ashell \
                  eww \
                  bottom \
                  polkit-gnome \
                  totem \
                  hyprland-per-window-layout \
                  hyprshot \
                  hyprls \
                  waypaper
```

```
$ cd /tmp && git clone https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme && \
cd Kanagawa-GKT-Theme/themes && \
./install.sh --tweaks black -t all -l
```

```
$ systemctl enable --now --user ssh-agent.service
```

```
$ rm -rf ~/.config/hypr && \
ln -sv ${PWD}/hypr ~/.config
```
