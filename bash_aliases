# Put aliases here!
# set some to run in background automatically using &
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ..='cd ..'
# Check to make sure I actully want to do it
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Send to a pastebin site with, $ cat [file] |sprunge
#alias sprunge='curl -F \'sprunge=<-\' http://sprunge.us'
alias unmount='umount'

alias dhcp-kill='sudo dhcpcd -k; sudo dhcpcd'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    
	alias grep='grep --line-number --with-filename --color=auto'
    alias fgrep='fgrep --line-number --with-filename --color=auto'
    alias egrep='egrep --line-number --with-filename --color=auto'
fi

system-update() {
	# Archlinux
	if [ -x /usr/bin/pacman ]; then
		sudo pacman -Syu;
		return;
	fi

	# Debian
	if [ -x /usr/bin/apt-get ]; then
		sudo apt-get update && sudo apt-get upgrade;
		return;
	fi

	# Apple
	if [  -x /usr/sbin/softwareupdate ]; then
		sudo softwareupdate -i -a
	fi

	echo "No package manager found";
}
