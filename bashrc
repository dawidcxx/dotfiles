# If not running interactively, don't do anything
[[ $- != *i* ]] && return

aur_get(){
	cd ~/Downloads
	git clone "https://aur.archlinux.org/$1.git"
}
yt_vlc() {
	cd /tmp
	youtube-dl --write-auto-sub -f best -o "'vid.%(ext)s'" "$1" 
	vlc --sub-autodetect-file --sub-file ./'vid.en.vtt' 
}

alias pac='sudo pacman'
alias sys='sudo systemctl'
alias sysr='sudo systemctl daemon-reload && echo "reloaded"'
alias ls='ls --color=auto'
alias ll='ls -alh'
PS1='[\u@\h \W]\$ '
export HISTSIZE=100000

export EDITOR="code"
export BROWSER="firefox"
export PATH=~/.local/bin:$PATH

export PROMPT_COMMAND='history -a'
