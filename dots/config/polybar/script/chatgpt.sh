#!/usr/bin/env bash

# Buka qutebrowser dengan profil ChatGPT
qutebrowser -B "$HOME/.config/qutebrowser/local/chatgpt" https://chat.openai.com &

# Tunggu jendela muncul
sleep 1

# Ambil window ID terakhir qutebrowser yang muncul
WIN_ID=$(xdotool search --onlyvisible --class qutebrowser | tail -n1)

# Atur floating
bspc node $WIN_ID -t floating

# Atur ukuran dan posisi (rectangle=widthxheight+x+y)
bspc node $WIN_ID -r rectangle=506x550+400+30
