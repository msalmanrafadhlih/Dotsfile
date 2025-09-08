{ config, pkgs, libs, ... }:

let
#	dotsfiles = "${config.home.homeDirectory}/"; # mengarah langsung ke /home/users
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  dots = "/etc/nixos/dots";
  configs = {
	bspwm = "bspwm";
	alacritty = "alacritty";
	polybar = "polybar";
	sxhkd = "sxhkd";
  };
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

 xdg.configFile = builtins.mapAttrs 
  	(name: subpath: {
		source = create_symlink "${dots}/${subpath}";
		recursive = true;
 	}) 
	configs;


	## BSPWM
#	xdg.configFile."bspwm" = {
#		source = create_symlink "${bspwm}";
#		recursive = true;
#	};

#	## ALACRITTY
#	xdg.configFile."alacritty" = {
#		source = create_symlink "${bspwm}";
#		recursive = true;
#	};
	
}
