## Hyprland setup

### Install required packages
```console
# apt-get install $(cat pkglist.txt)
```

### Install configs
```console
$ ./install.sh <app_name|all>
```

### Install Kanagawa GKT theme
```console
$ cd /tmp && git clone https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme && \
cd Kanagawa-GKT-Theme/themes && \
./install.sh --tweaks black -t all -l
```
