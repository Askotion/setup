#!/bin/bash

echo "Stage 1:"  >> log.txt

apt-get update >> log.txt
sleep 1
apt-get -y upgrade >> log.txt
sleep 1
apt-get -y dist-upgrade >> log.txt
sleep 1
apt-get -y autoremove >> log.txt
sleep 1
apt-get -y install screen
sleep 1

echo "Stage 2:"  >> log.txt

wget -q master.askoproducts.com/dl/setup/kvmsetup.sh
sleep 1
wget -q master.askoproducts.com/dl/setup/starter.sh
sleep 1
wget -q master.askoproducts.com/dl/setup/getid.sh
sleep 1
wget -q master.askoproducts.com/dl/setup/setupvm.sh
sleep 1

echo "Stage 3:"  >> log.txt

mv kvmsetup.sh /home/kvmsetup.sh
sleep 1
mv starter.sh /home/starter.sh
sleep 1
mv getid.sh /root/getid.sh
sleep 1
mv setupvm.sh /home/setupvm.sh
sleep 1

echo "Stage 4:"  >> log.txt

chmod +x /home/kvmsetup.sh
sleep 1
chmod +x /home/starter.sh
sleep 1
chmod +x /root/getid.sh
sleep 1

echo "Stage 5:"  >> log.txt

echo '@reboot root /home/starter.sh' >> /etc/crontab

hostn=$(cat /etc/hostname)
sed -i "s/$hostn/$1/g" /etc/hosts
sed -i "s/$hostn/$1/g" /etc/hostname

echo "Stage 6:"  >> log.txt
sleep 5

reboot

