#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#fix cursor
xsetroot -cursor_name left_ptr

#start some shit
#~/.dropbox-dist/dropboxd &
nm-applet &
/usr/bin/xscreensaver -no-splash &

#compositing
xcompmgr -c &

#set background
feh --bg-scale ~/Pictures/Walls/joy.png

#start xmonad
exec ck-launch-session xmonad 

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
