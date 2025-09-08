#!/bin/sh
id=$(xinput list | grep -i touchpad | grep -o 'id=[0-9]*' | cut -d= -f2)

state=$(xinput list-props "$id" | grep "Device Enabled" | awk '{print $4}')

if [ "$state" -eq 1 ]; then
  xinput disable "$id"
else
  xinput enable "$id"
fi
