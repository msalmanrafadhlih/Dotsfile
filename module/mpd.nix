{ config, pkgs, services, ... }:

let
  local = "${config.home.homeDirectory}/.config/mpd";
  home = "${config.home.homeDirectory}";
in
{
  services.mpd = {
    enable = true;

    musicDirectory = "${home}/Musics";
    playlistDirectory = "${local}/Playlists";
    dataDir = "${local}/dataDir";

    network.listenAddress = "127.0.0.1";
    network.port = 6600;

    extraConfig = ''
        follow_outside_symlinks "yes"
        follow_inside_symlinks "yes"
        auto_update "yes"
        log_level "verbose"

        audio_output {
            type "pulse"
            name "PipeWire pulse"
        }
    '';
  };
  
	home.packages = with pkgs; [
		mpc
	];
}

