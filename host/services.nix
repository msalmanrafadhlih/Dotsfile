{ config, lib, pkgs, service, ...  }:

let
  home = "/home/tquilla";
  db = "/var/lib/mpd";
in

{
  boot = {
	plymouth = {
		enable = true;
	};
    consoleLogLevel = 0; # set level log kernel (0=sepi, 7=verbose)
    initrd.verbose = false; # matikan output initrd
    kernelParams = [ "quiet" "loglevel=3" "rd.systemd.show_status=0" "udev.log_level=3" ];
  };
  
  services = {  
  	xserver = {
		enable = true;
		windowManager = { 
			dwm = {
				enable = true;
				package = pkgs.dwm.overrideAttrs (old: {
				          src = ../../dots/config/dwm;
				};
			};
			bspwm = {
				enable = true;
			};
		};
		
		autoRepeatDelay = 300; 
		autoRepeatInterval = 35;
		videoDrivers = [ "intel" "modesetting" ];
		displayManager.lightdm.enable = true;
  	};
	
  	libinput = {
  		enable = true;
        touchpad = {
            tapping = true;
            naturalScrolling = true;
            disableWhileTyping = true;
            sendEventsMode = "disabled-on-external-mouse";
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

  	gvfs = {
  		enable = true;
  		package = pkgs.gnome.gvfs;
	};
	
  	pipewire = {
		enable = true;
		pulse.enable = true;
  	};  	

	udev = {
		enable = true;
		extraRules = ''
			ACTION=="add", SUBSYSTEM=="input", ATTRS{name}=="2.4G Mouse", \
			ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/tquilla/.Xauthority", \
			RUN+="${pkgs.xorg.xinput}/bin/xinput --disable 'SYNA3602:00 0911:5288 Touchpad'"

			ACTION=="remove", SUBSYSTEM=="input", ATTRS{name}=="2.4G Mouse", \
			ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/tquilla/.Xauthority", \
			RUN+="${pkgs.xorg.xinput}/bin/xinput --enable 'SYNA3602:00 0911:5288 Touchpad'"
			## 'SYNA3602:00 0911:5288 Touchpad' & "2.4G Mouse" is my touchpad and mouse name, check 'xinput list' in terminal!
		'';
	};
  };
}
