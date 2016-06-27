#!/bin/bash


# Variables

LOG=/root/setup.log



# Methods



function delay()
{
    sleep 0.2;
}

#
# Description : print out executing progress
# 
CURRENT_PROGRESS=0
function progress()
{
    PARAM_PROGRESS=$1;
    PARAM_STATUS=$2;

    if [ $CURRENT_PROGRESS -le 0 -a $PARAM_PROGRESS -ge 0 ]  ; then echo -ne "[..........................] (0%)  $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 5 -a $PARAM_PROGRESS -ge 5 ]  ; then echo -ne "[#.........................] (5%)  $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 10 -a $PARAM_PROGRESS -ge 10 ]; then echo -ne "[##........................] (10%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 15 -a $PARAM_PROGRESS -ge 15 ]; then echo -ne "[###.......................] (15%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 20 -a $PARAM_PROGRESS -ge 20 ]; then echo -ne "[####......................] (20%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 25 -a $PARAM_PROGRESS -ge 25 ]; then echo -ne "[#####.....................] (25%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 30 -a $PARAM_PROGRESS -ge 30 ]; then echo -ne "[######....................] (30%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 35 -a $PARAM_PROGRESS -ge 35 ]; then echo -ne "[#######...................] (35%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 40 -a $PARAM_PROGRESS -ge 40 ]; then echo -ne "[########..................] (40%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 45 -a $PARAM_PROGRESS -ge 45 ]; then echo -ne "[#########.................] (45%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 50 -a $PARAM_PROGRESS -ge 50 ]; then echo -ne "[##########................] (50%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 55 -a $PARAM_PROGRESS -ge 55 ]; then echo -ne "[###########...............] (55%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 60 -a $PARAM_PROGRESS -ge 60 ]; then echo -ne "[############..............] (60%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 65 -a $PARAM_PROGRESS -ge 65 ]; then echo -ne "[#############.............] (65%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 70 -a $PARAM_PROGRESS -ge 70 ]; then echo -ne "[###############...........] (70%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 75 -a $PARAM_PROGRESS -ge 75 ]; then echo -ne "[#################.........] (75%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 80 -a $PARAM_PROGRESS -ge 80 ]; then echo -ne "[####################......] (80%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 85 -a $PARAM_PROGRESS -ge 85 ]; then echo -ne "[#######################...] (90%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 90 -a $PARAM_PROGRESS -ge 90 ]; then echo -ne "[##########################] (100%) $PARAM_PHASE \r" ; delay; fi;
    if [ $CURRENT_PROGRESS -le 100 -a $PARAM_PROGRESS -ge 100 ];then echo -ne 'Done!                                            \n' ; delay; fi;

    CURRENT_PROGRESS=$PARAM_PROGRESS;

}

#################################### DEMO ######################################

# This is a simple demostration

# Important notice: below code is not necessary in your code, remember to remove before using

################################################################################

echo "The task is in progress, please wait a few seconds"

progress 10 Initialize

progress 20 "Phase 1      "

###
apt-get update >> $LOG 2>&1
sleep 1
apt-get -y upgrade >> $LOG 2>&1
sleep 1
apt-get -y dist-upgrade >> $LOG 2>&1
sleep 1
apt-get -y autoremove >> $LOG 2>&1
sleep 1
apt-get -y install screen
sleep 1
###

progress 40 "Phase 2      "

####
wget -q master.askoproducts.com/dl/setup/kvmsetup.sh
sleep 1
wget -q master.askoproducts.com/dl/setup/starter.sh
sleep 1
wget -q master.askoproducts.com/dl/setup/getid.sh
sleep 1
wget -q master.askoproducts.com/dl/setup/setupvm.sh
sleep 1
###


progress 60 "Processing..."

###
mv kvmsetup.sh /home/kvmsetup.sh
sleep 1
mv starter.sh /home/starter.sh
sleep 1
mv getid.sh /root/getid.sh
sleep 1
mv setupvm.sh /home/setupvm.sh
sleep 1
###

progress 80 "Processing..."

###
mv kvmsetup.sh /home/kvmsetup.sh
sleep 1
mv starter.sh /home/starter.sh
sleep 1
mv getid.sh /root/getid.sh
sleep 1
mv setupvm.sh /home/setupvm.sh
sleep 1
###

progress 90 "Processing..."

###
chmod +x /home/kvmsetup.sh
sleep 1
chmod +x /home/starter.sh
sleep 1
chmod +x /root/getid.sh
sleep 1
###

progress 100 "Done        "

echo '@reboot root /home/starter.sh' >> /etc/crontab

hostn=$(cat /etc/hostname)
sed -i "s/$hostn/$1/g" /etc/hosts
sed -i "s/$hostn/$1/g" /etc/hostname

reboot

echo










