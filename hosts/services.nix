{ config, lib, pkgs, service, ...  }:

{
  services = {
  	mpd  = {
  		enable = true;
		user = "tquilla";
		group = "users";
  			
  		musicDirectory = "/home/tquilla/Music";
  		playlistDirectory = "/home/tquilla/Music";
  		dataDir = "/home/tquilla/.local/share/mpd";

  		extraConfig = ''
  			audio_output {
				type "alsa"
				name "ALSA Output"
				device "default"
  			}
  			audio_output {
				type "pulse"
				name "PulseAudio Output"
  			}
  		'';
  	};

  	xserver = {
		enable = true;
		autoRepeatDelay = 200;
		autoRepeatInterval = 35;
		videoDrivers = [ "intel" "modesetting" ];

		windowManager.bspwm.enable = true;
		displayManager.lightdm.enable = true;
  	};

  	libinput = {
  		enable = true;
        touchpad = {
            tapping = true;
            naturalScrolling = true;
            disableWhileTyping = true;
        };
  	};

  	dbus.packages = with pkgs; [
		dconf
  	];

  	pipewire = {
		enable = true;
		pulse.enable = true;
		alsa.enable = true;
		jack.enable = true;
  	};

  	
  };
}
