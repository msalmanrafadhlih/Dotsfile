#!/usr/bin/env bash

#brave --user-data-dir=$HOME/.config/BraveSoftware/local --app="https://chat.openai.com" --class=ChatAi &
surf https://chat.openai.com &
sleep 0.5
xprop -id $(xdotool getactivewindow) -f WM_CLASS 8s -set WM_CLASS "ChatAi"
