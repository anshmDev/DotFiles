#!/bin/bash
xrdb --merge .Xresources &
xinput --set-prop 'Logitech G502 HERO Gaming Mouse' 'libinput Accel Profile Enabled' 0, 1 & 
nitrogen --restore &
killall -q picom; picom &
