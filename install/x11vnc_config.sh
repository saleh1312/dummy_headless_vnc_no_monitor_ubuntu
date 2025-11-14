#!/usr/bin/expect -f

set timeout 5

spawn x11vnc -storepasswd

expect "Enter VNC password:"
send "12345\r"

expect "Verify password:"
send "12345\r"

expect "Write password to /home/*/.vnc/passwd?  (y/n)"
send "y\r"

expect eof
