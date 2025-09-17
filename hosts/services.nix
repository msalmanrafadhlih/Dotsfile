{ config, lib, pkgs, service, ...  }:

let
  home = "/home/tquilla";
  db = "/var/lib/mpd";
in

{
  services = {  
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
  	
  	journald = {
		storage = "auto";
		extraConfig = ''
			RuntimeMaxUse=50M
			SystemMaxUse=100M
			MaxRetentionSec=14day
			SystemMaxFileSize=10M
		'';
  	};

  	dbus.packages = with pkgs; [
		dconf
  	];

  	pipewire = {
		enable = true;
		pulse.enable = true;
  	};  	
  };
}
