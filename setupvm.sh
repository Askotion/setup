#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
        exit 0;
fi

userID=$1;
option=$2;

# ========== Functions ============

function setupBasic () {

cp /home/clashauto.qcow2 /home/"$userID".qcow2
virt-install -n $userID -r 4096 --os-type=windows --vcpus=2 --os-variant=win2k8 --disk /home/"$userID".qcow2,device=disk,bus=ide,format=qcow2 --network bridge=virbr0,model=virtio --graphics vnc,password=clashauto999,keymap=de,listen=0.0.0.0 --noautoconsole --import

}

function setupPro () {

cp /home/clashauto.qcow2 /home/"$userID".qcow2
virt-install -n $userID -r 6144 --os-type=windows --vcpus=6 --os-variant=win2k8 --disk /home/"$userID".qcow2,device=disk,bus=ide,format=qcow2 --network bridge=virbr0,model=virtio --graphics vnc,password=clashauto999,keymap=de,listen=0.0.0.0 --noautoconsole --import

}

# ========= Main ============


if [[ $option == "basic"  ]] ; then

        setupBasic > /dev/null;
fi

if [[ $option == "pro"  ]] ; then

        setupPro;
fi
