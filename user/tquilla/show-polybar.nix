{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/show-polybar.sh" = {
	  text = ''
#!/usr/bin/env bash
bspc config top_padding 28
bspc config bottom_padding 28

~/.config/polybar/launch.sh &
	  '';
  };
}
