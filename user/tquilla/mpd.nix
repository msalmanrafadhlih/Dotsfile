{ config, pkgs, services, ... }:

{
  # Install paket MPD dan client
  home.packages = with pkgs; [
    mpd
    mpc_cli
    rmpc
  ];

  # Jalankan MPD sebagai user service
  services.mpd = {
    enable = true;

    # Folder musik user
    musicDirectory = "${config.home.homeDirectory}/.local/share/mpd/Musics";

    # Network supaya client bisa connect
    network.listenAddress = "127.0.0.1";

    # Extra config, gabungkan semua setting dari mpd.conf lama
    extraConfig = ''
      # Database & state files
      db_file            "${config.home.homeDirectory}/.local/share/mpd/database"
      log_file           "${config.home.homeDirectory}/.local/share/mpd/log"
      pid_file           "${config.home.homeDirectory}/.local/share/mpd/pid"
      state_file         "${config.home.homeDirectory}/.local/share/mpd/state"
      sticker_file       "${config.home.homeDirectory}/.local/share/mpd/sticker.sql"

      # Playlist
      playlist_directory "${config.home.homeDirectory}/.local/share/mpd/Musics"

      # MPD options
      gapless_mp3_playback "yes"
      follow_outside_symlinks "yes"
      follow_inside_symlinks "yes"
      auto_update "yes"
      user "tquilla"
      log_level "verbose"

      # Audio output
      audio_output {
          type "alsa"
          name "ALSA output"
          device "default"
          mixer_type "software"
      }
    '';
  };
}

