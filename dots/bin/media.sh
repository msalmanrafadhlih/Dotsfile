#!/bin/sh

case "$1" in
  --next) playerctl next ;;
  --previous) playerctl previous ;;
  --toggle) playerctl play-pause ;;
  --stop) playerctl stop ;;
esac
