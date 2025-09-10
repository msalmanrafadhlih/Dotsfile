{ config, lib, pkgs, service, ...  }:

{
  services = {
  	mpd  = {
  		enable = true;
  		musicPlaylistDirectory = "/${HOME}/Musics";
  		dataDir = "/${HOME}/.local/share/mpd";
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
