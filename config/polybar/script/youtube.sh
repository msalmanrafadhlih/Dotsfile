#!/usr/bin/env bash

kdocker -f -q chromium --user-data-dir=$HOME/.config/vivaldi/local --app="https://www.youtube.com" --class=youtube &

#surf "https://chat.openai.com"
