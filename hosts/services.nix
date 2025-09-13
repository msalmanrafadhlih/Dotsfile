{ config, lib, pkgs, service, ...  }:

{
  services = {
  	mpd = {
  		enable = true;
  		user = "tquilla";
  		group = "users";
  		musicDirectory = "/home/tquilla/Musics";
  		
  		network.port = 6600;
  		network.listenAddress = "127.0.0.1";
  		
  		extraConfig = ''
		  audio_output {
		    type  "alsa"
		    name  "ALSA Output"
		    device "default"
		    mixer_type "software"
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
		alsa.enable = true;
  	};

  	
  };
}
