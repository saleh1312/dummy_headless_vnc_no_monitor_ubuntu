#!/bin/bash

echo "[prepare.sh] Updating package lists"
sudo apt update

echo "[prepare.sh] Installing expect (required for x11vnc password automation)"
sudo apt install expect -y

echo "[prepare.sh] Installing dummy video driver (xserver-xorg-video-dummy)"
sudo apt install -y xserver-xorg-video-dummy

echo "[prepare.sh] Installing XFCE4 desktop and dependencies"
sudo apt install -y xfce4 xfce4-goodies dbus-x11

echo "[prepare.sh] Installing x11vnc server"
sudo apt install x11vnc -y

echo "[prepare.sh] Installing Firefox browser"
sudo apt install firefox -y