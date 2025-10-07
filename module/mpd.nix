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
            type "alsa"
            name "ALSA Output"
        }
    '';
  };
  
#  services.librespot = {
#    enable = false;
#    deviceName = "MPD Spotify";
#    backend = "alsa"; # atau "alsa" jika tidak pakai PulseAudio/PipeWire
#    cache = "/home/tquilla/.cache/librespot";
#    # optional: gunakan token akun Spotify Premium
#    username_cmd = "cat ~/.config/spotify/username";
#    password_cmd = "cat ~/.config/spotify/credentials";
#  };
#  # agar bisa dikontrol lewat playerctl dan polybar

  home.packages = with pkgs; [
		playerctl
		mpc
  ];
}
