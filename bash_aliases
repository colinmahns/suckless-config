# Put aliases here!
# set some to run in background automatically using &
alias ls='ls --color=auto'
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

# Because I'm too stupid to remember the actual command
alias ifconfig='ip addr'
# What I type when I get angry
alias shutup='sudo !!'

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
	# openSUSE
	if [ -x /usr/bin/zypper ]; then
		sudo zypper update;
		return;
	fi
	
	# Fedora / RHEL
	if [ -x /usr/bin/yum ]; then
		sudo yum update;
		return;
	fi

	# Debian
	if [ -x /usr/bin/apt-get ]; then
		sudo apt-get update && sudo apt-get upgrade;
		return;
	fi
	
	#OpenWRT
	if [ -x /bin/opkg ]; then
		sudo opkg update; # not sure if this only refreshes repo, or if it updates as well. The packages don't seem to change much...
		return;
	fi

	# Apple
	if [  -x /usr/sbin/softwareupdate ]; then
		sudo softwareupdate -i -a
	fi
	# Windows or not on list
	echo "No package manager found";
}
