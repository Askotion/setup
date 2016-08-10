#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
        exit 0;
fi

userID=$1;
option=$2;
botname=$3;

# ========== Functions ============

function setupBasic () {

cp /home/"$botname".img /home/"$userID".img
virt-install -n $userID -r 3072 --os-type=windows --vcpus=2 --os-variant=win2k8 --disk /home/"$userID".img,device=disk,bus=ide,format=qcow2 --network bridge=virbr0,model=virtio --graphics vnc,password=clashauto999,keymap=de,listen=0.0.0.0 --noautoconsole --import

}

function setupPro () {

cp /home/"$botname".img /home/"$userID".img
virt-install -n $userID -r 5120 --os-type=windows --vcpus=4 --os-variant=win2k8 --disk /home/"$userID".img,device=disk,bus=ide,format=qcow2 --network bridge=virbr0,model=virtio --graphics vnc,password=clashauto999,keymap=de,listen=0.0.0.0 --noautoconsole --import

}

function setupLuxury () {

cp /home/"$botname".img /home/"$userID".img
virt-install -n $userID -r 7168 --os-type=windows --vcpus=6 --os-variant=win2k8 --disk /home/"$userID".img,device=disk,bus=ide,format=qcow2 --network bridge=virbr0,model=virtio --graphics vnc,password=clashauto999,keymap=de,listen=0.0.0.0 --noautoconsole --import

}

# ========= Main ============


if [[ $option == "basic"  ]] ; then

        setupBasic > /dev/null;
fi

if [[ $option == "pro"  ]] ; then

        setupPro > /dev/null;
fi

if [[ $option == "luxury"  ]] ; then

        setupLuxury > /dev/null;
fi