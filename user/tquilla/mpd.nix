{ config, pkgs, services, ... }:

let
  local = "${config.home.homeDirectory}/.local/share/mpd";
in
{
  programs.mpd = {
    enable = true;
    musicDirectory = "${local}/Musics";
    network.listenAddress = "127.0.0.1";
    network.port = 6600;

    extraConfig = ''
      db_file            "${local}/database"
      log_file           "${local}/log"
      pid_file           "${local}/pid"
      state_file         "${local}/state"
      sticker_file       "${local}/sticker.sql"
      playlist_directory "${local}/Musics"

      gapless_mp3_playback "yes"
      follow_outside_symlinks "yes"
      follow_inside_symlinks "yes"
      auto_update "yes"
      log_level "verbose"

      audio_output {
          type "pulse"
          name "PulseAudio"
      }
    '';
  };
}

