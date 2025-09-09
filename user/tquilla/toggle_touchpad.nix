{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/battery.sh" = {
    text = ''
	#!/bin/sh
	id=$(xinput list | grep -i touchpad | grep -o 'id=[0-9]*' | cut -d= -f2)

	state=$(xinput list-props "$id" | grep "Device Enabled" | awk '{print $4}')

	if [ "$state" -eq 1 ]; then
	  xinput disable "$id"
	  dunstify -i input-touchpad-symbolic -r 1004 -u low "Touchpad" "Disabled"
	else
	  xinput enable "$id"
	  dunstify -i input-touchpad-symbolic -r 1004 -u low "Touchpad" "Enabled"
	fi
    '';
    executable = true;
  };
}

