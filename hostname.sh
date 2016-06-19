#!/bin/bash


# Test if the user puts a Argument
if [[ $# -eq 0 ]] ; then
    echo 'You have to define in a Hostname!'
    echo 'Usage: ./hostname.sh <hostname> '
    exit 0
fi

echo '@reboot root /home/starter.sh' >> /etc/crontab

# Removing log from last time
rm log.txt

# Updating and Upgrading Server
apt-get update >> log.txt
apt-get -y upgrade >> log.txt
apt-get -y dist-upgrade >> log.txt
apt-get -y install git >> log.txt
apt-get -y screen git >> log.txt

mkdir ~/git
git clone https://github.com/Askotion/setup.git ~/git/

mv ~/git/setup/kvmsetup.sh /home/kvmsetup.sh
mv ~/git/setup/starter.sh /home/starter.sh
mv ~/git/setup/getid.sh /root/getid.sh
mv ~/git/setup/setupvm.sh /home/setupvm.sh

chmod +x /home/kvmsetup.sh
chmod +x /home/starter.sh
chmod +x /root/getid.sh


# Saving Argument 1 in Textfile
echo $1 >> var.txt

# Grepping Argument out of the File into a variable
ip=$(cat var.txt)


# Replacing Hostname with Argument
function hostname () {
hostn=$(cat /etc/hostname) &&
sed -i "s/$hostn/$ip/g" /etc/hosts &&
sed -i "s/$hostn/$ip/g" /etc/hostname
}

# Executing Function
hostname

# Removing Text File
rm var.txt

# Rebooting
reboot

