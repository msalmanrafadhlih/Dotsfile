{ config, pkgs, services, ... }:

let
  local = "${config.home.homeDirectory}/.local/share/mpd";
in
{
  services.mpd = {
    enable = true;
    user = "tquilla";
    group = "users";

    musicDirectory = "${home}/Musics";
    playlistDirectory = "${home}/Musics";
    dataDir = "${db}dataDir";

    network.listenAddress = "127.0.0.1";
    network.port = 6600;

    extraConfig = ''
        db_file            "${db}/database"
        pid_file           "${db}/pid"
        state_file         "${db}/state"
        sticker_file       "${db}/sticker.sql"

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

