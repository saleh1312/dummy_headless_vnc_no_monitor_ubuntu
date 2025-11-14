#!/bin/bash

################################ start dummy Xorg server ###############################
# Start Xorg with dummy configuration
/usr/bin/X :0 -config /etc/X11/xorg.conf


############################### start xfce with dummy display ###############################
# Set display for dummy X server
export DISPLAY=:0

# Allow local user to access X server
xhost +SI:localuser:$USER

# Start XFCE in background (non-blocking)
startxfce4 >/tmp/xfce.log 2>&1 &


############################### start x11vnc server ###############################
x11vnc -shared -forever -nodpms -noxdamage -rfbport 5900 -display :0 -bg -o /var/log/x11vnc.log -rfbauth /home/$USER/.vnc/passwd



