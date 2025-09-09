{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/battery.sh" = {
    text = ''
      #!/bin/sh

      BAT="/sys/class/power_supply/BAT0"
      capacity=$(cat "$BAT/capacity")
      status=$(cat "$BAT/status")

      # Tentukan ikon berdasarkan persen
      if [ "$capacity" -le 10 ]; then
        icon="$HOME/.local/share/icons/battery/battery_0.png"
      elif [ "$capacity" -le 30 ]; then
        icon="$HOME/.local/share/icons/battery/battery_20.png"
      elif [ "$capacity" -le 50 ]; then
        icon="$HOME/.local/share/icons/battery/battery_40.png"
      elif [ "$capacity" -le 70 ]; then
        icon="$HOME/.local/share/icons/battery/battery_60.png"
      elif [ "$capacity" -le 90 ]; then
        icon="$HOME/.local/share/icons/battery/battery_80.png"
      else
        icon="$HOME/.local/share/icons/battery/battery_full.png"
      fi

      # Kirim notifikasi
      if [ "$status" = "Discharging" ] && [ "$capacity" -le 20 ]; then
        dunstify -i "$icon" \
          -h int:value:"$capacity" \
          -r 2001 \
          -u critical "Battery Low" "${capacity}% remaining"
        canberra-gtk-play -i battery-low -d "Battery Warning"
      elif [ "$status" = "Full" ] || { [ "$status" = "Charging" ] && [ "$capacity" -ge 95 ]; }; then
        dunstify -i "$icon" \
          -h int:value:"$capacity" \
          -r 2002 \
          -u normal "Battery Full" "You can unplug the charger"
        canberra-gtk-play -i complete -d "Battery Full"
      fi
    '';
    executable = true;
  };
}

