```
$ rm -rf ~/.config/bat && \
mkdir ~/.config/bat && \
ln -sv ${PWD}/config ~/.config/bat && \
ln -sv ${PWD}/themes ~/.config/bat && \
bat cache --build
```
