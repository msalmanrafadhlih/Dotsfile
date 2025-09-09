{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/battery.sh" = {
    text = ''
	#!/bin/sh

	case "$1" in
	  --inc) pamixer -i 5 ;;
	  --dec) pamixer -d 5 ;;
	  --toggle) pamixer -t ;;
	esac

	vol=$(pamixer --get-volume)
	mute=$(pamixer --get-mute)

	if [ "$mute" = "true" ]; then
	  dunstify -i audio-volume-muted-symbolic -r 1002 -u low "Volume" "Muted"
	else
	  dunstify -i audio-volume-high-symbolic \
	    -h int:value:"$vol" \
	    -r 1002 \
	    -u low "Volume" "''${vol}%"
	fi
    '';
    executable = true;
  };
}

