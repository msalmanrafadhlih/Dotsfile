{ config, pkgs, libs, ... }:

let
  ## bin = "${config.home.homeDirectory"}; # mengarah langsung ke /home/users/.local/bin
  bin = "/.local/bin";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  dots = "/etc/nixos/dots";
  
  configs = {
	bspwm = "bspwm";
	alacritty = "alacritty";
	polybar = "polybar";
	sxhkd = "sxhkd";
  };
  locals = {
    	"brightness.sh" = "brightness.sh";
    	"volume.sh" = "volume.sh";
    	"media.sh" = "media.sh";
    	"toggle_touchpad.sh" = "toggle_touchpad.sh";	
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
		source = create_symlink "${dots}/config/${subpath}";
		recursive = true;
 	}) 
	configs;

 home.file."${bin}" = builtins.mapAttrs
    	(name: subpath: {
      		source = create_symlink "${dots}/bin/${subpath}";
      		recursive = true;
    	})
    	locals;

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
