{ libs, services, program, ... }:

{
  home.file.".local/bin/bg-slideshow" = {
    text = ''
		#!/bin/sh
		BG=~/Pictures/Wallpaper
		
        feh --bg-scale --randomize "$BG"
	'';
	executable = true;
  };
}
