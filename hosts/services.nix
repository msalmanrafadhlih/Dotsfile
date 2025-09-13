{ config, lib, pkgs, service, ...  }:

let
  local = "/home/tquilla/.local/share/mpd";
in

{
  services = {
#	mpd = {
#		enable = true;
#		musicDirectory = "${local}/Musics";
#		dataDir = "${local}dataDir";
#		
#		network.listenAddress = "127.0.0.1";
#		network.port = 6600;
#
#		extraConfig = ''
##			db_file            "${local}/database"
##			log_file           "${local}/log"
##			pid_file           "${local}/pid"
##			state_file         "${local}/state"
##			sticker_file       "${local}/sticker.sql"
##			playlist_directory "${local}/Musics"
#
#			gapless_mp3_playback "yes"
#			follow_outside_symlinks "yes"
#			follow_inside_symlinks "yes"
#			auto_update "yes"
#			log_level "verbose"
#
#			audio_output {
#				type "pulse"
#				name "PulseAudio"
#			}
#		'';
#	};
  
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
		jack.enable = true;
  	};  	
  };
}
