{ libs, services, program, ... }:

{
  home.file.".local/bin/bg-slideshow" = {
    text = ''
		#!/bin/sh
		WALLPAPER_DIR=~/Pictures/Wallpaper

		while true; do
		    for img in "$WALLPAPER_DIR"/*; do
		        feh --bg-scale --randomize "$img"
		        sleep 600  # 10 menit
		    done
		done
	'';
	executable = true;
  };
}
