{ config, pkgs, nixpkgs-unstable, pkgs-stable, ... }:

{

  programs.bash = {
        enable = true;
        initExtra = ''
		export PS1='\[\e[38;5;47m\]\u\[\e[0m\] in \[\e[38;5;214m\]\w\[\e[0m\] \\$ '
	'';

        shellAliases = {
	  test = "I use NixOS btw";	 

	 ##  SYSTEM CONFIGURATIONS
	  NIXOS = "tree /etc/nixos && cd /etc/nixos";
	  NIX = "nano /etc/nixos/hosts/configuration.nix";
	  HNIX = "bat /etc/nixos/hosts/hardware-configuration.nix";
	  FLAKE = "nano /etc/nixos/flake.nix";
	  LOCK = "bat /etc/nixos/flake.lock";

	 ## GIT INTEGRATION
	  GIT = "git add . && git commit -m";

	 ##  USER CONFIGURATIONS {EDIT}
	  KEY = "bat /etc/nixos/user/tquilla/bash.nix";
	  TQU = "ls -la /etc/nixos/user/tquilla && cd /etc/nixos/user/tquilla";
  	  HOME = "nano /etc/nixos/user/tquilla/home.nix";
	  BASH = "nano /etc/nixos/user/tquilla/bash.nix";
	  INSTALL = "nano /etc/nixos/user/tquilla/packages.nix";
	  BAT = "nano /etc/nixos/user/tquilla/bat.nix";
	  XINIT = "nano /etc/nixos/user/tquilla/xinitrc.nix";
	  MEDIA = "nano /etc/nixos/user/tquilla/media.nix";
	  PAD = "nano /etc/nixos/user/tquilla/toggle_toushpad.nix";
	  VOL = "nano /etc/nixos/user/tquilla/volume.nix";
	  BRIGHT = "nano /etc/nixos/user/tquilla/brightness.nix";
	  BAT0 = "nano /etc/nixos/user/tquilla/battery.nix";

	 ##  USER CONFIGURATIONS {SAVE}
	  BASHSAVE = "sudo chmod +x .bashrc";
	  UTILS = "chmod +x ~/.local/bin/*.sh";
	  

	 ##  DOTSFILE CONNFIGURATION & BSPWM
	  DOTS = "tree /etc/nixos/dots/ && cd /etc/nixos/dots/";
	  ER = "nano /etc/nixos/dots/config/bspwm/src/ExternalRules";
	  BSPWM = "nano /etc/nixos/dots/config/bspwm/bspwmrc";
	  SXHKD = "nano /etc/nixos/dots/config/sxhkd/sxhkdrc";
	  ALAC = "nano /etc/nixos/dots/config/alacritty/alacritty.toml";
	  POLYBAR = "nano /etc/nixos/dots/config/polybar/config.ini";
	  	  
	  
	  SAVE = "sudo nixos-rebuild switch";
	  SAVEFLAKE = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
          GBG = "nix-collect-garbage";
	  OPTIMISE = "nix-store --optimise";
	  GC = "nix-store --gc";
	  CLEAR = "clear";
	  
	  ## POWER
	  REBOOT = "sudo reboot";
	  END = "poweroff";
	  
        };
  };
}
