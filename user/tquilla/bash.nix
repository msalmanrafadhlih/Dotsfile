{ config, pkgs, nixpkgs-unstable, pkgs-stable, ... }:

{

  programs.bash = {
        enable = true;
        initExtra = ''

        	PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; 
        	PS1='\[\e[92m\]\u\[\e[0m\] \[\e[38;5;244;2;5m\]\s\[\e[0m\]in \[\e[93m\]\w\[\e[0m\] \$ ~ \[\e[91m\]''${PS1_CMD1}\n\[\e[0m\]'

			[ -z "$TMUX" ] && tmux
			
			export HISTSIZE=5000
		    export HISTFILESIZE=10000
		    export HISTCONTROL=ignoredups:erasedups
		    export PATH="$HOME/.local/bin:$PATH"
#		    export PROMPT_COMMAND='echo -ne "\e]7;file://''${PWD}\a"'
		    shopt -s histappend
			shopt -s autocd
	    	shopt -s cdspell
	    	shopt -s nocaseglob
    	'';
    	
        shellAliases = {
        
			test = "I use NixOS btw";	 
			PING = "ping google.com";
			NIXOS = "tree /etc/nixos && cd /etc/nixos";
			RUNNING = "systemctl --user list-units --state=running";
			SYSRUNNING = "systemctl list-units --state=running";
			USAGELOG = "sudo journalctl --disk-usage";

			    
			##  SYSTEM CONFIGURATIONS
			HOSTS = "cd /etc/nixos/hosts && tree /etc/nixos/hosts";
			NIX = "nano /etc/nixos/hosts/configuration.nix";
			HNIX = "bat /etc/nixos/hosts/hardware-configuration.nix";
			FLAKE = "nano /etc/nixos/flake.nix";
			LOCK = "bat /etc/nixos/flake.lock";
			FONTS = "nano /etc/nixos/hosts/fonts.nix";
			SYSINSTALL = "nano  /etc/nixos/hosts/system-packages.nix";
			SERVICE = "nano  /etc/nixos/hosts/services.nix";

			## GIT INTEGRATION
			GIT = "git add . && git commit -m";
			CLASS = "xprop | grep CLASS";
			NAME = "xprop | grep NAME";

			##  USER CONFIGURATIONS {EDIT}
			TQU = "ls -la /etc/nixos/user/tquilla && cd /etc/nixos/user/tquilla";
			KEY = "bat /etc/nixos/user/tquilla/bash.nix";
			HOME = "nano /etc/nixos/user/tquilla/home.nix";
			BASH = "nano /etc/nixos/user/tquilla/bash.nix";
			INSTALL = "nano /etc/nixos/user/tquilla/packages.nix";
			BAT = "nano /etc/nixos/user/tquilla/bat.nix";
			XSESSION = "nano /etc/nixos/user/tquilla/xsession.nix";
			MEDIA = "nano /etc/nixos/user/tquilla/media.nix";
			PAD = "nano /etc/nixos/user/tquilla/toggle_touchpad.nix";
			VOL = "nano /etc/nixos/user/tquilla/volume.nix";
			BRIGHT = "nano /etc/nixos/user/tquilla/brightness.nix";
			BAT0 = "nano /etc/nixos/user/tquilla/battery.nix";
			NANO = "nano /etc/nixos/user/tquilla/nanorc.nix";
			MPD = "nano /etc/nixos/user/tquilla/mpd.nix";
			BRANCH = "nano /etc/nixos/user/tquilla/git-prompt.nix";
			TAR = "nano /etc/nixos/user/tquilla/tar.nix";
			RMPC = "nano /etc/nixos/user/tquilla/rmpc.nix";
			TMUX = "nano /etc/nixos/user/tquilla/tmux.nix";
			
			##  USER CONFIGURATIONS {SAVE}
			BASHSAVE = "sudo chmod +x .bashrc";
			UTILS = "chmod +x ~/.local/bin/*.sh";
			

			##  DOTSFILE CONNFIGURATION & BSPWM
			CONFIG = "tree /etc/nixos/dots/config && cd /etc/nixos/dots/config";
			MODULE = "tree /etc/nixos/dots/config/polybar && cd /etc/nixos/dots/config/polybar/modules";			
			SCRIPT =  "cd /etc/nixos/dots/config/polybar/script && tree";

			ER = "nano /etc/nixos/dots/config/bspwm/src/ExternalRules";
			BSPWM = "nano /etc/nixos/dots/config/bspwm/bspwmrc";
			SXHKD = "nano /etc/nixos/dots/config/sxhkd/sxhkdrc";
			POLY = "nano /etc/nixos/dots/config/polybar/config.ini";
			ALAC = "nano /etc/nixos/dots/config/alacritty/alacritty.toml";
			DUNST = "nano /etc/nixos/dots/config/dunst/dunstrc";
			CURSOR = "nano ~/.icons/default/index.theme";
			PCOM = "nano /etc/nixos/dots/config/picom/picom.conf";
			ANIMA = "nano /etc/nixos/dots/config/picom/picom-animations.conf";

			## Suckless Stuff
			NSHELL = "nix-shell";
			PATCH = "patch -p1 <";
			CONF = "cd /etc/nixos/dots/config/st  && nano config.def.h";
			CONFSAVE = "mv config.h config.h.bak && cp config.def.h config.h";
			CONFDEL = "cp config.h.bak config.def.h && mv config.h.bak config.h";
			MAKE = "make clean && make && make install PREFIX=$HOME/.local";
						  
			##  OTHER
			SAVE = "sudo nixos-rebuild switch";
			SAVEFLAKE = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";

			OLD = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
			GBGOLD = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +3";
			GBG = "nix-collect-garbage";
			OPTIMISE = "nix-store --optimise";
			GC = "nix-store --gc";
			CLEANER = "rm -rf ~/.cache/nix && rm -rf /tmp/nix-build-* && rm -rf ~/.local/share/Trash/*";
			CLEAR = "clear";

			PKG = "nix search nixpkgs";
			SRC = "fc-list | grep -i";
			FONTLIST = "fc-match -s";
			PKGLIST = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";

			## productivities
			DMUSIC = "yt-dlp --trim-filenames 80 --restrict-filenames -x --audio-format mp3 -S 'abr,codec' -o '~/.local/share/mpd/Musics/%(playlist|NA)s/%(title)s [%(id)s].%(ext)s'";
			DVIDEO = "yt-dlp --trim-filenames 80 --restrict-filenames -S 'res:720,codec,br,fps' -f 'bv*+ba/best' -o '~/Videos/%(playlist|NA)s/%(title)s [%(id)s].%(ext)s'";
			DTAR = "~/.local/bin/tar.sh";
			XYZ = "~/.local/bin/xyz.sh";
			
			## POWER
			REBOOT = "sudo reboot";
			OFF = "poweroff";
	  
        };
  };
}
