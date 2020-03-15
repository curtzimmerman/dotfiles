#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# binding escape to caps
setxkbmap -option caps:escape

#bspwm &
#exec startplasma-x11

#switching desktop environments based on parameter
session=${1:-kde}

case $session in
	i3|i3wm)
		picom -b &
	       	exec i3;;
	kde) 
		exec startplasma-x11;;
	bspwm)
		picom -b &
		~/.fehbg &
		exec bspwm;;
	*)
		exec $1;;
esac


