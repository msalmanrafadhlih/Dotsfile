#!/bin/sh

# Kill existing instances
killall -q polybar

# Tunggu sampai semua proses polybar mati
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

# Jalankan bar (satu bar untuk tiap monitor, kalau ingin)
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example -c ~/.config/bspwm/polybar/config.ini &
  done
else
  polybar --reload example -c ~/.config/bspwm/polybar/config.ini &
fi
