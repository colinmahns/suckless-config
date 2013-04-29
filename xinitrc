#!/bin/sh
#eval "$(gpg-agent --daemon)"

# No trackpad tapping
/usr/bin/synclient MaxTapTime=0

# Disable system beep
xset -b

# Mute by default
amixer -q set Master mute
amixer -q set Master 0

# Autolock after 10 minutes
xautolock -time 10 -locker slock&

# Libnotify
dunst&

# Set background
feh --bg-scale ~/Pictures/Wallpapers/current&

# Credit to http://en.gentoo-wiki.com/wiki/Dwm#Custom_Status_Bar_1

wifi(){
      STATUS="X`iwgetid`"
      if test "$STATUS" != "X" ; then
        ESSID="`iwgetid |awk -F ":" '{print $2}'|sed -e 's/"//g'`"
        LINK="`awk '/wlo1:/ {print $3}' /proc/net/wireless |sed -e 's/\.//g'`"
      echo " $ESSID:$LINK"
      fi
    } 

batt(){
    PRESENT=`cat /sys/class/power_supply/BAT0/present`
    if test "$PRESENT" != "0" ; then
      FULL=`cat /sys/class/power_supply/BAT0/charge_full`
      CHARGE=`cat /sys/class/power_supply/BAT0/charge_now`
      STATUS=`cat /sys/class/power_supply/BAT0/status`

      CHARGE=$((${CHARGE}*100/${FULL}))
      case $STATUS in
        Full)
          SIGN="=";;
        Charging)
          SIGN="+";;
        Discharging)
          SIGN="-";;
      esac
      echo " ${CHARGE}${SIGN}"
    else
      echo " AC"
    fi
    }

# TODO make it only use amixer once
volume(){
      STATUS="`amixer get Master |awk '/Mono:/ {print $6}'`"
      if test "$STATUS" != "[on]" ; then 
		echo " Mute"
      else
        echo " `amixer get Master |awk '/Mono:/ {print $4}' | sed -e 's/\[//g'|sed -e 's/%\]//g'`v"
      fi
	}

# TODO make it use cmus-remote -Q only once
cmusstats(){
      if test "X`pgrep cmus`" != "X" ; then 
        TIME="`cmus-remote -Q |awk '/duration/ {print $2}'`"
        CURR="`cmus-remote -Q |awk '/position/ {print $2}'`"
        ARTIST="`cmus-remote -Q |sed -ne '/artist/s/tag artist //pg'`"
        TITLE="`cmus-remote -Q |sed -ne '/title/s/tag title //pg'`"
        echo "$TITLE ($ARTIST) $CURR/$TIME"
      fi
    }

while true; do
  xsetroot -name "`cmusstats``wifi``volume``batt` `date '+%a %F / %T'`"
  sleep 1
done &
exec /usr/bin/dwm
