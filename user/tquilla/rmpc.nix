{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/rmpc.sh" = {
    text = ''
    #!/usr/bin/env bash
	alacritty -e rmpc --class=floating &
    '';
    executable = true;
  };
}
