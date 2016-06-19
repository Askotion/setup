#!/bin/bash

#  kmvsetup.sh
#  
#
#  Created by Kay Probst on 06/12/15.
#


LOG=/root/setup.log

sed -i '$ d' /etc/crontab


# - Variables - #

sshkeyfirma=\
'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcW1wjKTw7auJBgiv5LEmC1wOxJ+JdWVa2lV/7py+mI3MthyAfvYrFU2F1cZ3fnSaCKa+gIU33PWxLztEACBOfCWMtUjRy5GGMnfR2Uwdf1SZoGMv39GMYvrHvCU5rMd9JEvaf5H9Erk7jceZpYYTMeY3FrXO0u6eC5Pmwe+2g1Cbzzz7a9AGdIYnN2L1M+ys1yyn2CEbWQNbv5h2a7RuyVwTcMsalS2Gt/+K1JGzKS8BVZRchayhINaCNQsTSsw5cNTdG5fSuVjFkH8iKhKs7WbE9jFlTiWM1gJbNn/jUx0qoEjkHaJPby2YffSi35nPfcYYaiXtd7THPv3IJHJW/ kprobst@kprobst'

sshkey=\
'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1dPKulXFoApU0HVW08evHteJo4PDMJDmv5md3CqGA09Uoje3LjitHZwlYz08o1IuJ04ntt9uH38YRco38oGB+rBqs+EDVdeAh5f4foIL3c66FYz6fknD2JPeSVUNswUzTB2uVXSUrn/EZc2keGxUWxltz18LdJHQnKKd+Rnw440/LMuo9rA250kI4jjZWhH/kS6gLLgtGqxFOCIFa6hnQK30NJu0xlTlou7sg/VGObEGj7hyYJ0TnbfiswZEdqBBD4w8yaQtZe+nREVn13uS2UQq9HTQ3GFL200Yk9jDFcjIFMkV8SNpma3RLsRvSnykVsiY9+EbjXrjOfiFxaQEbdRtaqmJf/EHuE1XDRff7IWJX41RaqHRrfp7tYYzrPnnnyOM4cBU4WearHHKcLq0zk03MtrfMZaHbyRsL5F6RaZfiVw5fsf3evr5ygWP9iyYXJ1+WVsViZT23ldlopVYnX8o00YvRcNhbMGdVDS5wW0uJQfOL4Gnf+mtvPhOr+CJ619yYIuqS5bK/jP2YvFE2hS02J3NVygLZnD1Cl7sNcJklkqpRDqkGl6sl31u9Gq/5C0OjCXEDoBnE1Ocu1o10lDMhzbFwWDSdOPgDID4rFDxZCIR3RWlKU9Lg4YFIsG0ZUAh8bUjW44E/jjdIchgs/2PVLDl/I6nWE6BQWmP5/w== Kay@kay-macbook-pro15.fritz.box'

virtimport=\
'virt-install -n ClashAuto01 -r 4096 --os-type=windows --vcpus=2 --os-variant=win2k8 --disk /home/CAServer01.qcow2,device=disk,bus=ide,format=qcow2 --network bridge=virbr0,model=virtio --graphics vnc,password=clashauto999,port=5911,keymap=de,listen=0.0.0.0 --noautoconsole --import'


# - Variables - #




# - Functions - #

function update() {
apt-get update >> $LOG 2>&1 &&
echo "$sshkeyfirma" >>/root/.ssh/authorized_keys &&
echo "$sshkey" >>/root/.ssh/authorized_keys
}

function kvminstall() {
apt-get -y install fail2ban qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils virtinst >> $LOG 2>&1
}

function verify() {
adduser `id -un` libvirtd >> $LOG 2>&1
}

function download() {
wget -q --user=username --password=download https://master.askoproducts.com/dl/clashauto.qcow2 &&
mv clashauto.qcow2 /home/clashauto.qcow2 &&
chmod 777 /home/clashauto.qcow2 >> $LOG 2>&1
}

function import() {
$virtimport >> $LOG 2>&1
}

function guestfish() {
DEBIAN_FRONTEND=noninteractive apt-get -y install libguestfs-tools &&
apt-get -y install libguestfs-tools &&
update-guestfs-appliance >> $LOG 2>&1
}





# - Functions - #







clear
echo -e "\t\t\t\t####################################\t\t\t\t"
echo -e "\t\t\t\t#            Welcome to            #\t\t\t\t"
echo -e "\t\t\t\t#          my Install Script       #\t\t\t\t"
echo -e "\t\t\t\t#              by Kay              #\t\t\t\t"
echo -e "\t\t\t\t####################################\t\t\t\t"
sleep 2

clear
echo -e "\t# 1) - Starting Update for new Node - #\t"
update
sleep 2

echo -e "\t# 2) - Download additional files .. - #\t"
download
sleep 2

echo -e "\t# 3) - Starting the KVM installation - #\t"
kvminstall
sleep 2

echo -e "\t# 4) - Starting QemuSetup for Node - #\t"
verify
sleep 2

echo -e "\t# 5) - Copying 1. Stack of Images - #\t"
cp1
sleep 2

echo -e "\t# 6) - Copying 2. Stack of Images - #\t"
cp2
sleep 2

echo -e "\t# 7) - Copying 3. Stack of Images - #\t"
#cp3
sleep 2

echo -e "\t# 8) - Copying 4. Stack of Images - #\t"
#cp4
sleep 2

echo -e "\t# 9) - Importing 1. Virtual Host - #\t"
import
sleep 2

echo -e "\t# 10) - Installting Guestfish pa - #\t"
guestfish
sleep 2

echo -e "\t# 11) - Setup finished! Enjoy it!!! - #\t"
sleep 2


