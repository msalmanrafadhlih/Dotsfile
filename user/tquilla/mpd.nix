{ config, pkgs, services, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/.local/share/mpd/Musics"; # folder Music user kamu
    network.listenAddress = "127.0.0.1"; # biar rmpc/mpc bisa connect

    extraconfig = ''
		audio_output {
			type "pulse"
			name "pulseaudio"
		}
    '';
  };
}
