{ config, pkgs, libs, ... }:

let
  # bin = "${config.home.homeDirectory}/.local/bin"; # mengarah langsung ke /home/users/.local/bin
  bin = ".local/bin";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  dots = "/etc/nixos/dots";
  systemd = "/etc/nixos/dots/config/systemd";
  
  configs = {
	bspwm = "bspwm";
	alacritty = "alacritty";
	polybar = "polybar";
	sxhkd = "sxhkd";
	"systemd/user/battery-notif.service" = "systemd/user/battery-notif.service";
	"systemd/user/battery-notif.timer" = "systemd/user/battery-notif.timer";
  };

#  locals = {
#  	".local/bin/brightness.sh" = "brightness.sh"
#  };

in

{
 home.username = "tquilla";
 home.homeDirectory = "/home/tquilla";
 programs.git.enable = true;
 home.stateVersion = "25.05";

## ~/.config
 xdg.configFile = builtins.mapAttrs (name: subpath: {source = 
	create_symlink "${dots}/config/${subpath}";
	recursive = true;
 }) configs;	

# home.file = builtins.mapAttrs(name: subpath: {source = 
#	create_symlink "${dots}/bin/${subpath}";
# }) locals;


 imports = [
	./bash.nix
	./packages.nix
	./bat.nix
	./xinitrc.nix	
	./battery.nix
	./brightness.nix
	./toggle_touchpad.nix
	./volume.nix
	./media.nix
	./nanorc.nix
 ];
	
}
