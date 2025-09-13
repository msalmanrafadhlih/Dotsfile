{ config, pkgs, services, ... }:

let
  local = "${config.home.homeDirectory}/.local/share/mpd";
  home = "/home/tquilla";
  db = "/var/lib/mpd";
in
{
  services.mpd = {
    enable = true;
#    user = "tquilla";
#    group = "users";

    musicDirectory = "${local}/Musics";
    playlistDirectory = "${local}/Musics";
    dataDir = "${local}dataDir";

    network.listenAddress = "127.0.0.1";
    network.port = 6600;

    extraConfig = ''
        db_file            "${local}/database"
        pid_file           "${local}/pid"
        state_file         "${local}/state"
        sticker_file       "${local}/sticker.sql"

        follow_outside_symlinks "yes"
        follow_inside_symlinks "yes"
        auto_update "yes"
        log_level "verbose"

        audio_output {
            type "pulse"
            name "PulseAudio"
        }

        audio_output {
            type "pipewire"
            name "PipeWire"
        }
    '';
  };
}

