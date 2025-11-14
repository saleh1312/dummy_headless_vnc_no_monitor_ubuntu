# source : 

https://techoverflow.net/2019/02/23/how-to-run-x-server-using-xserver-xorg-video-dummy-driver-on-ubuntu/


# better conf file : 

https://gist.github.com/divinity76/ce210b5dbcd9ea7d0585ac403caef577


# full instructions 

## install the packeges

sudo apt update
sudo apt install -y xserver-xorg-video-dummy


## copy the below content of <better conf file> and paste it here -> sudo nano /etc/X11/xorg.conf



## copy the below content and paste it here -> sudo nano /etc/systemd/system/dummyx.service
[Unit]
Description=Dummy Xorg Server
After=network.target

[Service]
User=root
ExecStart=/usr/bin/X :0 -config /etc/X11/xorg.conf
Restart=always

[Install]
WantedBy=multi-user.target

## enable it
sudo systemctl daemon-reload
sudo systemctl enable dummyx
sudo systemctl start dummyx


## test
ps aux | grep Xorg
