#!/usr/bin/env bash

player=$(playerctl -l 2>/dev/null | grep -E 'mpd|spotify' | head -n 1)
[[ -z "$player" ]] && echo "🎵" && exit

status=$(playerctl -p "$player" status 2>/dev/null)
meta=$(playerctl -p "$player" metadata --format "{{ artist }} - {{ title }}" 2>/dev/null)

if [[ "$status" == "Playing" ]]; then
    icon=""
elif [[ "$status" == "Paused" ]]; then
    icon=""
else
    icon=""
fi

echo "$icon $meta"
