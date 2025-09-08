#!/bin/sh

case "$1" in
  --inc) pamixer -i 5 ;;
  --dec) pamixer -d 5 ;;
  --toggle) pamixer -t ;;
esac
