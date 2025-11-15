sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh


sudo apt install git -y


git clone https://github.com/saleh1312/dummy_headless_vnc_no_monitor_ubuntu.git
cd dummy_headless_vnc_no_monitor_ubuntu/
chmod +x ./install.sh
chmod +x ./create_display.sh


./install.sh
./create_display.sh :0