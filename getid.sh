#!/bin/bash

id=('virt-win-reg'" $1 "'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\TeamViewer\')


function getid () {

$id

}

getid | grep ClientID > /root/id.txt

test=$(cat /root/id.txt)

uncon=$(echo -n $test | tail -c 8)

echo "$((16#$uncon))" | sed 's/.\{3\}/& /g'

rm -rf /root/id.txt

