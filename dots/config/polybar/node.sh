#!/bin/bash
state=$(bspc query -N -n focused -T | jq -r '.state')
flags=$(bspc query -N -n focused -T | jq -r '.flags')

icon=""

case $state in
  tiled)        icon="" ;;   # tiled
  pseudo_tiled) icon="" ;;   # pseudo tiled
  floating)     icon="" ;;   # floating
  fullscreen)   icon="" ;;   # fullscreen
esac

# tambahkan flags (append icons)
[[ $flags == *"locked"* ]]  && icon+=" "
[[ $flags == *"sticky"* ]]  && icon+=" "
[[ $flags == *"private"* ]] && icon+=" "

echo "$icon"
