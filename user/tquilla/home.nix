{ config, pkgs, libs, ... }:
let
#  dotsfiles = "${config.home.homeDirectory}/"; # mengarah langsung ke ~/.config
  	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
	bspwm = "/etc/nixos/dots/bspwm";
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
		recursive = true;
		source = create_symlink "${bspwm}";
	};
 };

 xdg.configFile = {
	"alacritty/alacritty.toml" = { 
		source = create_symlink "${bspwm}/alacritty/alacritty.toml";
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
