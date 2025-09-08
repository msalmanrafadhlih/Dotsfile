{ config, pkgs, ... }:
let
#  dotsfiles = "${config.home.homeDirectory}/"; # mengarah langsung ke ~/.config
 create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

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

 home.file = {

	".config/bspwm" = { 
		source =  config.lib.file.mkOutOfStoreSymlink "../../dots/bspwm";
	};

	".config/alacritty" = {
		source =  config.lib.file.mkOutOfStoreSymlink "../../dots/bspwm/alacritty";
	};
 };

	## BSPWM
# 	xdg.configFile."bspwm" = {
#		source = create_symlink "../../dots/bspwm";
#		recursive = true;
#	};
	## ALACRITTY
#	xdg.configFile."alacritty" = {
#		source = create_symlink "../../dots/bspwm/alacritty";
#		recursive = true;
#	};
	
}
