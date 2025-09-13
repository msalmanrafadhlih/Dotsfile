{ config, pkgs, ... }:

{
  programs.mpd = {
    enable = true;

    # Default music directory (wajib di-set, walau di mpd.conf sudah ada)
    musicDirectory = "/home/tquilla/.local/share/mpd/Musics";

    # Konfigurasi tambahan sesuai mpd.conf milikmu
    extraConfig = ''
      playlist_directory  "/home/tquilla/.local/share/mpd/Musics"
      db_file             "/home/tquilla/.local/share/mpd/dbFile"
      log_file            "/home/tquilla/.local/share/mpd/mpd.log"
      pid_file            "/home/tquilla/.local/share/mpd/mpd.pid"
      state_file          "/home/tquilla/.local/share/mpd/state"
      sticker_file        "/home/tquilla/.local/share/mpd/sticker.sql"

      follow_outside_symlinks "yes"
      follow_inside_symlinks "yes"

      bind_to_address "127.0.0.1"
      port "6600"

      audio_output {
        type "alsa"
        name "ALSA Output"
        device "default"
        mixer_type "software"
      }

      log_level "verbose"
      auto_update "yes"
    '';
  };
}
