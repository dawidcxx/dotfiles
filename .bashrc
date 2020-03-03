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
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
PS1='[\u@\h \W]\$ '
export HISTSIZE=100000

export EDITOR="code"
export BROWSER="brave"
export PATH=~/.local/bin:$PATH
export PROMPT_COMMAND='history -a'

export GRAALVM_HOME=~/.sdk/java/current

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/dawid/.sdkman"
[[ -s "/home/dawid/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dawid/.sdkman/bin/sdkman-init.sh"
