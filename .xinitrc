#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


xsetroot -cursor_name left_ptr
#trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --transparent true --alpha 0 --tint 0x000000 --height 16 &  
#xmobar ~/.xmobarrc &
exec xmonad 

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
