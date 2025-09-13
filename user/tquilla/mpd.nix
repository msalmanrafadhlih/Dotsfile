{ config, pkgs, services, ... }:

let
	local = "/home/tquilla/.local/share/mpd"
in

{
  # Jalankan MPD sebagai user service
  services.mpd = {
    enable = true;

    user = "tquilla";
    group = "users";
    
    ## Directory
    musicDirectory = "${local}/Musics";
    playlistDirectory = "${local}/Musics"
	dbFile = "${local}/dbFile";
	dataDir = "${local}/dataDir";
	
	
#	credentials = [
#		passwordFile = "path/to/file";
#		permissions = [ "read" "add" "control" "admin" ];
#	]

	## Other
	fluidsynth = false;
    startWhenNeeded = true;
    
    network.listenAddress = "127.0.0.1";
    network.port = "6600";
    

    # Extra config, gabungkan semua setting dari mpd.conf lama
    extraConfig = ''
    
      # MPD options
      gapless_mp3_playback "yes"
      follow_outside_symlinks "yes"
      follow_inside_symlinks "yes"
      auto_update "yes"
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

