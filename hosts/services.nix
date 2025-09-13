{ config, lib, pkgs, service, ...  }:

{
  services = {
  	mpd = {
  		enable = true;
  		user = "tquilla";   # pakai user kamu sendiri
  		musicDirectory = "/home/tquilla/Musics";

  		extraConfig = ''
    		audio_output {
      			type  "pulse"
      			name  "PulseAudio"
    		}
  		'';
	};


  	xserver = {
		enable = true;
		autoRepeatDelay = 300;
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
