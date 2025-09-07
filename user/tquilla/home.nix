{ config, pkgs, ... }:

{
 home.username = "tquilla";
 home.homeDirectory = "/home/tquilla";
 programs.git.enable = true;
 home.stateVersion = "25.05";

 imports = [
	./bash.nix
	./packages.nix
	./bat.nix
 ];

 	xdg.configFile."bspwm".source = ../../dots/bspwm;
	xdg.configFile."alacritty".source = ../../dots/bspwm/alacritty;
	
}
