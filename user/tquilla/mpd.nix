{ libs, service, ... }:

{
	services.mpd = {
	  enable = true;
	  musicDirectory = "/home/tquilla/Musics";
	  extraConfig = ''
	    audio_output {
	      type "pulse"
	      name "PulseAudio"
	    }
	  '';
	};
}
