HISTFILE=~/.history
HISTSIZE=5000
SAVEHIST=5000

LANG=en_US.utf-8

unsetopt beep
bindkey -e
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# Prompt
#autoload -U promptinit
#promptinit
#prompt adam1

PS1='%{[22;44m%}%n@%m%{[00m%} %{[01;36m%}%(4~|...|)%3~%{[01;37m%} %# %{[00m%}'
RPS1='%D{%K:%M}'


# Normal aliases
alias l='ls -al'
alias ..='cd ..'
alias ...='cd ../..'

# Make it nice
alias lsof='lsof -i'
alias ls='ls --color=auto'
alias xterm='xterm -geometry +bdc +dc -rightbar -bw 3 -bg black -fg white -cr white'
alias grep='grep --color=auto -n'
alias fgrep='fgrep --color=auto -n'

# Little gadgets
alias http='python -m SimpleHTTPServer'
alias myip='curl ifconfig.me/ip'
alias sucker='ps aux | sort -nk +4 | tail'
alias big='du -s * | sort -n | tail'
alias 64='[[ `getconf LONG_BIT` -eq "64" ]] && echo Yes'
alias t='date +%T | figlet -f big'

# Some replacements
alias ping='mtr'
alias notify='notify-send'


# Variables
PATH="$PATH:/var/lib/gems/1.8/bin"

# zsh colors
setopt extendedglob
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'

# Flowcontroll off
stty -ixon

# export LIMPRUNTIME=/home/aaron/bin/limp-0.3.4/0.3.4

# Some OSX stuff
[[ -s "/home/aaron/.rvm/scripts/rvm" ]] && source "/home/aaron/.rvm/scripts/rvm"

