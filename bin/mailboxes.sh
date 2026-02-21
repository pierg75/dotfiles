#!/usr/bin/bash

# Script to help with neomutt sidebar mailboxes
# The default maildir is set to ~/Maildir/, change eventually the MAILDIR var

function usage {
    echo "$1 [maildir name]"
}

if [[ -z "$1" ]]; then
    usage "$0"
    exit 1
fi

MAILDIR=~/Maildir
ACCOUNT="$1"

# Get all the entried in Maildir
mapfile -t entries < <( fd cur "$MAILDIR"/"$ACCOUNT"|xargs -d "\n" dirname )

# Sort them
IFS=$'\n' sorted=($(sort <<<"${entries[*]}"))
unset IFS

# Get "Inbox" and swap it to be the first one 
inbox_idx=$(declare -p sorted | tr '\[' '\n' | awk -F "]" '/(Inbox|INBOX)/{print $1}')
tmp=${sorted[$inbox_idx]}               #Inbox
sorted[$inbox_idx]=${sorted[0]}         #Inbox->Beaker
sorted[0]=$tmp                          #Beaker->Inbox

# Print them
for entry in "${sorted[@]}"; do
    echo "\"$entry\""
done
