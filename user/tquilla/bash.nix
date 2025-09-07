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
	  NIX = "nano ~/.nixos/configuration.nix";
	  HNIX = "nano ~/.nixos/hardware-configuration.nix";
	  FLAKE = "nano ~/.nixos/flake.nix";
	  LOCK = "nano ~/.nixos/flake.lock";

	 ##  USER CONFIGURATIONS
	  KEY = "bat /etc/nixos/user/tquilla/bash.nix";
	  TQU = "ls -la ~/.nixos/user/tquilla && cd ~/.nixos/user/tquilla";
  	  HOME = "nano ~/.nixos/user/tquilla/home.nix";
	  BASH = "nano ~/.nixos/user/tquilla/bash.nix";
	  INSTALL = "nano ~/.nixos/user/tquilla/packages.nix";
	  BAT = "nano ~/.nixos/user/tquilla/bat.nix";

	 ##  DOTSFILE CONNFIGURATION
	  BSPWM = "nano ~/.nixos/dots/bspwm/bspwm/bspwmrc";
	  SXHKD = "nano ~/.nixos/dots/bspwm/sxhkd/sxhkdrc";
	  ALAC = "nano ~/.nixos/dots/bspwm/alacritty/alacritty.toml";
	  POLYBAR = "nano ~/.nixos/dots/bspwm/polybar/config.ini";

	  SAVE = "sudo nixos-rebuild switch";
	  SAVEFLAKE = "sudo nixos-rebuild switch --flake ~/.nixos#nixos";
          GBG = "nix-collect-garbage";
	  OPTIMISE = "nix-store --optimise";
	  GC = "nix-store --gc";
	  
        };
  };
}
