#!/usr/bin/env bash

kdocker -f -q chromium  --user-data-dir=$HOME/.config/vivaldi/ChatAi --app="https://claude.ai/new" --class=ChatAi &

#surf "https://claude.ai/new"
