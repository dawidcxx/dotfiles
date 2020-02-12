# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export HISTSIZE=100000

export EDITOR="code"
export BROWSER="firefox"
export PATH=~/.local/bin:$PATH
