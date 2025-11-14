#!/usr/bin/expect -f

set timeout 5

send_user "[x11vnc_config.sh] Running x11vnc -storepasswd to create VNC password (interactive)\n"
send_user "[x11vnc_config.sh] If you want to change the password, edit this script or run 'x11vnc -storepasswd' manually.\n"

spawn x11vnc -storepasswd

expect "Enter VNC password:"
send "12345\r"

expect "Verify password:"
send "12345\r"

expect "Write password to /home/*/.vnc/passwd?  (y/n)"
send "y\r"

expect eof
send_user "[x11vnc_config.sh] VNC password stored into ~/.vnc/passwd\n"
