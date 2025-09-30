{ libs, services, program, ... }:

{
  home.file.".local/bin/bg-slideshow" = {
    text = ''
		#!/bin/sh
		BG=/home/tquilla/Pictures/Wallpaper/1360883.jpeg
		
        feh --bg-scale "$BG"
	'';
	executable = true;
  };
}
