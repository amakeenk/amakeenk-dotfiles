```
$ grep -q TERM=xterm-256color ${HOME}/.bashrc || \
echo "export TERM=xterm-256color" >>${HOME}/.bashrc

$ kitty +kitten themes --config-file-name theme.conf

Ctrl+Shift+F5
```
