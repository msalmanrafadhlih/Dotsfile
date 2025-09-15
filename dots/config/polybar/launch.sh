#!/bin/bash
CONFIG_DIR="$HOME/.config/polybar/modules"
MAIN_CONFIG="$HOME/.config/polybar/config.ini"

# Tutup polybar lama dulu
pkill  polybar

# Tunggu sampai benar-benar mati
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Gabung semua file jadi satu config sementara
cat "$MAIN_CONFIG" $CONFIG_DIR/*.ini > /tmp/polybar_full_config.ini

# Jalankan polybar
polybar -c /tmp/polybar_full_config.ini top & 
polybar bottom &

