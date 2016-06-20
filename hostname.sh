#!/bin/bash

echo "1)" >> log.txt
# Test if the user puts a Argument
if [[ $# -eq 0 ]] ; then
    echo 'You have to define in a Hostname!'
    echo 'Usage: ./hostname.sh <hostname> '
    exit 0
fi

echo '@reboot root /home/starter.sh' >> /etc/crontab
echo "2)" >> log.txt

# Updating and Upgrading Server
apt-get update >> log.txt
echo "3)" >> log.txt
apt-get -y upgrade >> log.txt
echo "4)" >> log.txt
apt-get -y dist-upgrade >> log.txt
echo "5)" >> log.txt
apt-get -y install screen >> log.txt
echo "6)" >> log.txt

function wget () {
echo "7)" >> log.txt &&
wget -q master.askoproducts.com/dl/setup/kvmsetup.sh &&
wget -q master.askoproducts.com/dl/setup/starter.sh &&
wget -q master.askoproducts.com/dl/setup/getid.sh &&
wget -q master.askoproducts.com/dl/setup/setupvm.sh
}

function mv () {
echo "8)" >> log.txt &&
mv kvmsetup.sh /home/kvmsetup.sh &&
mv starter.sh /home/starter.sh &&
mv getid.sh /root/getid.sh &&
mv setupvm.sh /home/setupvm.sh
}

function chmod () {
echo "9)" >> log.txt &&
chmod +x /home/kvmsetup.sh &&
chmod +x /home/starter.sh &&
chmod +x /root/getid.sh
}


# Saving Argument 1 in Textfile
echo $1 >> var.txt

# Grepping Argument out of the File into a variable
ip=$(cat var.txt)


# Replacing Hostname with Argument
function hostname () {
echo "10)" >> log.txt &&
hostn=$(cat /etc/hostname) &&
sed -i "s/$hostn/$ip/g" /etc/hosts &&
sed -i "s/$hostn/$ip/g" /etc/hostname
}


# Removing Text File
rm var.txt

# Executing Function
wget

# Executing Function
mv

# Executing Function
chmod

# Executing Function
hostname

# Rebooting
reboot

