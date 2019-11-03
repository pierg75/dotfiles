#!/bin/bash

echo "%{F#e2e2e2 T2}"
# Waits 10sec for the system to be operationnal
sleep 10

updates_count=$(checkupdates | wc -l)
notify_icon=/usr/share/icons/Paper/32x32/apps/system-software-update.png

if (( $updates_count > 0 )); then
    notify-send -i $notify_icon "Pacman" "$updates_count updates available"
    echo "%{F#728cbb T2}%{F#e2e2e2 T1} $updates_count"
else
    # System is now either up to date or no connection is available
    for interface in $(ls /sys/class/net/ | grep -v lo);
    do
        if [[ $(cat /sys/class/net/$interface/carrier) = 1 ]]; then
            online=1
        fi
    done
    if ! [ $online ]; then
        notify-send -i $notify_icon "Pacman" "Cannot check for updates (no internet)"
        echo "%{F#728cbb T2}%{F#e2e2e2 O-2 T3}%{O0}"
    else
        notify-send -i $notify_icon "Pacman" "System is up to date"
        echo "%{F#728cbb T2}%{F#e2e2e2 O-2 T3}%{O0}"
    fi
fi

