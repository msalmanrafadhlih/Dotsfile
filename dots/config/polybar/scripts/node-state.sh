#!/bin/bash
state=$(bspc query -N -n focused -T | jq -r '.state')
flags=$(bspc query -N -n focused -T | jq -r '.flags')

case $state in
  tiled) echo "" ;;             # tiled
  pseudo_tiled) echo "" ;;      # pseudo tiled
  floating) echo "" ;;          # floating
  fullscreen) echo "" ;;        # fullscreen
esac

# flags (append icons)
[[ $flags == *"locked"* ]] && echo -n " "
[[ $flags == *"sticky"* ]] && echo -n " "
[[ $flags == *"private"* ]] && echo -n " "
[[ $flags == *"marked"* ]] && echo -n " "
[[ $flags == *"hidden"* ]] && echo -n " "
