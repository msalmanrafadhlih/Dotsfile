{ config, pkgs, nixpkgs-unstable, pkgs-stable, ... }:

{

  programs.bash = {
        enable = true;
        initExtra = ''
		export PS1='\[\e[38;5;47m\]\u\[\e[0m\] in \[\e[38;5;214m\]\w\[\e[0m\] \\$ '
		'';

        shellAliases = {
        
		  test = "I use NixOS btw";	 
	  	  NIXOS = "tree /etc/nixos && cd /etc/nixos";

		        
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

		 ##  USER CONFIGURATIONS {EDIT}
		  TQU = "ls -la /etc/nixos/user/tquilla && cd /etc/nixos/user/tquilla";
		  KEY = "bat /etc/nixos/user/tquilla/bash.nix";
	  	  HOME = "nano /etc/nixos/user/tquilla/home.nix";
		  BASH = "nano /etc/nixos/user/tquilla/bash.nix";
		  INSTALL = "nano /etc/nixos/user/tquilla/packages.nix";
		  BAT = "nano /etc/nixos/user/tquilla/bat.nix";
		  XINIT = "nano /etc/nixos/user/tquilla/xinitrc.nix";
		  MEDIA = "nano /etc/nixos/user/tquilla/media.nix";
		  PAD = "nano /etc/nixos/user/tquilla/toggle_touchpad.nix";
		  VOL = "nano /etc/nixos/user/tquilla/volume.nix";
		  BRIGHT = "nano /etc/nixos/user/tquilla/brightness.nix";
		  BAT0 = "nano /etc/nixos/user/tquilla/nanorc.nix";
		  NANO = "nano /etc/nixos/user/tquilla/nanorc.nix";

		 ##  USER CONFIGURATIONS {SAVE}
		  BASHSAVE = "sudo chmod +x .bashrc";
		  UTILS = "chmod +x ~/.local/bin/*.sh";
		  

		 ##  DOTSFILE CONNFIGURATION & BSPWM
		  DOTS = "tree /etc/nixos/dots/ && cd /etc/nixos/dots/";
		  ER = "nano /etc/nixos/dots/config/bspwm/src/ExternalRules";
		  BSPWM = "nano /etc/nixos/dots/config/bspwm/bspwmrc";
		  SXHKD = "nano /etc/nixos/dots/config/sxhkd/sxhkdrc";
		  ALAC = "nano /etc/nixos/dots/config/alacritty/alacritty.toml";
		  POLY = "nano /etc/nixos/dots/config/polybar/config.ini";
		  FONT = "nano /etc/nixos/dots/config/fontconfig/fonts.conf";
		  
		  	  
		 ##  OTHER
		  SAVE = "sudo nixos-rebuild switch";
		  SAVEFLAKE = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";

		  OLD = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
		  GBGOLD = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +3";
	      GBG = "nix-collect-garbage";
		  OPTIMISE = "nix-store --optimise";
		  GC = "nix-store --gc";
		  CLEAR = "clear";

		  PKG = "nix search nixpkgs";
		  SRC = "fc-list | grep -i";
		  FONTLIST = "fc-match -s";
		  PKGLIST = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";
		    
		  ## POWER
		  REBOOT = "sudo reboot";
		  OFF = "poweroff";
	  
        };
  };
}
