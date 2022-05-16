#!/bin/sh

usage() {
    echo "$1 HOSTNAME"
}


if [[ -z $1 ]];
then
    usage $0
    exit 1
fi

HOST=$1

ip link show dev tun0 &> /dev/null
STATUS_DEV=$(echo $?)

ping -W2 -c1 "${HOST}" &> /dev/null
STATUD_PING=$(echo $?)

if [[ $STATUD_PING -eq 0 && $STATUS_DEV -eq 0 ]];
then
    echo '{"text":"Connected","class":"connected","percentage":100}' 
else
    echo '{"text":"Disconnected","class":"disconnected","percentage":0}'
fi
