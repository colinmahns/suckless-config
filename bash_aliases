# Put aliases here!
# set some to run in background automatically using &
MCDIR="$HOME/Documents/Other/minecraft.jar"
alias minecraft='java -Xmx1024M -Xms512M -cp ${MCDIR} net.minecraft.LauncherFrame &'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ..='cd ..'
# Check to make sure I actully want to do it
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
