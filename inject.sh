#!/bin/bash

sudo useradd elmacho
sudo useradd stuart
sudo useradd kevin
sudo useradd bob
sudo useradd vector
sudo useradd gru
sudo useradd phil
sudo passwd -d gru
sudo passwd -d bob
sudo usermod -aG sudo bob
sudo chown kevin /etc/passwd
sudo touch /opt/listen.sh
sudo mkdir /home/gru /home/ubuntu
sudo mkdir /home/gru/Desktop /home/ubuntu/Desktop
sudo echo 'thisisnotavirus' > /home/gru/Desktop/notavirus.dll
sudo echo 'auth sufficient pam_succeed_if.so user ingroup nopasswdlogin' > /etc/pam.d/gdm-password
sudo groupadd nopasswdlogin
sudo gpasswd --add gru nopasswdlogin
sudo groupadd apple
sudo usermod -aG apple phil
sudo usermod -aG apple stuart
sudo usermod -aG apple kevin
sudo sed -i "/Banner/d" /etc/ssh/sshd_config

sudo apt update 
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq postfix < /dev/null > /dev/null
sudo apt install gedit john rkhunter netcat mysql-server -y -qq

sudo sed -i '/Port/d' /etc/ssh/sshd_config
sudo sed -i '/PermitRoot/d' /etc/ssh/sshd_config
sudo sed -i '/PermitUserEnvironment/d' /etc/ssh/sshd_config
sudo sed -i '/PermitEmptyPasswords/d' /etc/ssh/sshd_config
sudo sed -i '/Protocol/d' /etc/ssh/sshd_config
sudo sed -i '/UsePAM/d' /etc/ssh/sshd_config

sudo sed -i '$ a Port 22' /etc/ssh/sshd_config
sudo sed -i '$ a PermitRootLogin yes' /etc/ssh/sshd_config
sudo sed -i '$ a PermitUserEnvironment no' /etc/ssh/sshd_config
sudo sed -i '$ a PermitEmptyPasswords yes' /etc/ssh/sshd_config
sudo sed -i '$ a Protocol 1,2' /etc/ssh/sshd_config
sudo sed -i '$ a UsePAM no' /etc/ssh/sshd_config

sudo sed -i '/security/d' /etc/apt/sources.list
sudo sed -i '/Update-Package-Lists/d' /etc/apt/apt.conf.d/10periodic
sudo sed -i '$ a APT::Periodic::Update-Package-Lists "0";' /etc/apt/apt.conf.d/10periodic
 
sudo sysctl -w kernel.dmesg_restrict=0
sudo sysctl -w kernel.ctrl-alt-del=1
sudo chmod 777 /etc/shadow
