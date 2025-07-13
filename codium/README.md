```
$ conf="${HOME}/.config/VSCodium/User/settings.json" && \
rm -fv ${conf} && \
ln -sv "${PWD}/settings.json" ${conf}
```
