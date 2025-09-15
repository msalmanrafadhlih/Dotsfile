{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/floating-window.sh" = {
    text = ''
		#!/usr/bin/env bash
		# Usage: floating_window.sh <app_command> <wm_class> <width> <height>

		APP_CMD="$1"
		WM_CLASS="$2"
		WIDTH="${3:-506}"
		HEIGHT="${4:-506}"

		# jalankan app jika belum jalan
		if ! pgrep -x "${WM_CLASS}" >/dev/null; then
		    $APP_CMD &
		fi

		# tunggu sampai window muncul
		while ! bspc query -N -n .window | xargs -I{} bspc query -T -n {} | grep -q "class.*${WM_CLASS}"; do
		    sleep 0.1
		done

		# ambil window ID terbaru
		WIN_ID=$(bspc query -N -n .window | xargs -I{} bspc query -T -n {} | grep -B5 "class.*${WM_CLASS}" | tail -n1 | jq -r '.id')

		# set floating
		bspc node $WIN_ID -t floating

		# set ukuran & posisi di tengah
		SCREEN_WIDTH=$(bspc query -T -n $WIN_ID | jq -r '.rectangle.width')
		SCREEN_HEIGHT=$(bspc query -T -n $WIN_ID | jq -r '.rectangle.height')

		X=$(( (SCREEN_WIDTH - WIDTH)/2 ))
		Y=$(( (SCREEN_HEIGHT - HEIGHT)/2 ))

		bspc node $WIN_ID -g ${WIDTH}x${HEIGHT}+${X}+${Y}

    '';
    executable = true;
  };
}

