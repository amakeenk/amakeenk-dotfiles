# import systemd bashrc
if [ -r /etc/bashrc ]; then
        . /etc/bashrc
fi

# import private bashrc
if [ -r ~/.bashrc_priv ]; then
        . ~/.bashrc_priv
fi

shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTCONTROL="ignoredups"
shopt -s cdspell
shopt -s cmdhist

clean_old_tasks() {
    tasks=$(apt-repo | grep 'x86_64 task' | cut -d'/' -f4)
    for _task in ${tasks}
    do
        _state="$(curl -s https://git.altlinux.org/tasks/${_task}/info.json | jq -r .state)"
        if [ "${_state}" == "EPERM" ] || [ "${_state}" == "TESTED" ]; then
            echo "Task ${_task} still available"
        else
            echo "Task ${_task} not available, delete it"
            sudo apt-repo rm ${_task}
        fi
    done
}

changelog_add() {
    _init=$1
    _spec=$(fd -I .spec$ .gear 2>/dev/null)
    if ! [ "${_spec}" ]; then
        echo "spec file not found"
    else
        _version=$(grep ^Version ${_spec} | cut -d' ' -f2)
        if [ "${_init}" == "init" ]; then
            echo "initial build"
            add_changelog -e "- Initial build for ALT." ${_spec}
        else
            echo "new version ${_version}"
            add_changelog -e "- Updated to version ${_version}." ${_spec}
        fi
    fi
}

vm() {
    _ip=$1
    ssh root@192.168.1.${_ip}
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias ls='eza --icons --header --group-directories-first'
alias ll='ls -la'
alias l='ls -l'
alias ltree='eza -T --level '
alias df='duf'
alias u='clean_old_tasks && sudo apt-get update'
alias ud='u && sudo apt-get -V dist-upgrade'
alias udk='ud && sudo update-kernel && cleannodepslibs'
alias udkc='sudo apt-repo clean && udk'
alias ara='sudo apt-repo add'
alias arm='sudo apt-repo rm'
alias art='clean_old_tasks && sudo apt-repo test'
alias arl='apt-repo list'
alias agip='u && sudo apt-get -V install'
alias agrp='sudo apt-get -V remove'
alias acs='apt-cache search'
alias acwd='apt-cache whatdepends'
alias sstat='systemctl status'
alias sstart='sudo systemctl start'
alias sstop='sudo systemctl stop'
alias ssres='sudo systemctl restart'
alias gpl='git pull'
alias gst='git status'
alias gdf='git diff'
alias glg='git log -p'
alias grst='git reset --hard'
alias gcl='git clone'
alias gad='git add'
alias gcm='git commit -m'
alias gplsm='git pull && git submodule update --init --recursive'
alias vhost='sudo vim /etc/hosts'
alias svim='sudo vim'
alias cleannodepslibs='agrp $(apt-cache list-nodeps | grep -E "devel|^lib[^-]*$" | grep -Ev "libvirt")'
alias ncdu='ncdu --color dark'
alias task_watch='neowatch -n 5 -d girar-show'
alias rm='rm -v'
alias cp='xcp'
alias girarbuild='ssh girar build'
alias girarrun='ssh girar task run'
alias girarls='ssh girar task ls'
alias gitaltinit='ssh git.alt init-db'
alias gitaltrm='ssh git.alt rm-db'
alias gitaltls='ssh git.alt ls'
alias calc='_(){ awk "BEGIN{print $*}";};_'

eval "$(starship init bash)"
eval "$(fzf --bash)"
eval "$(zoxide init --cmd cd bash)"

alias vim=nvim
export EDITOR=vim

# for kitty
export TERM=xterm-256color
