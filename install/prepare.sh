#!/bin/bash

sudo apt update

## expect install
sudo apt install expect -y

## dummy video driver install
sudo apt install -y xserver-xorg-video-dummy

## xfce4 install
sudo apt install -y xfce4 xfce4-goodies dbus-x11

## x11vnc install
sudo apt install x11vnc -y

