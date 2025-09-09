{ config, pkgs, libs, ... }:

  let
    bin = ".local/bin";
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    dots = "/etc/nixos/dots";

    configs = {
    
  	  bspwm = "bspwm";
  	  alacritty = "alacritty";
  	  polybar = "polybar";
  	  sxhkd = "sxhkd";
  	  nano = "nano";
  	
  	  "systemd/user/battery-notif.service" = "systemd/user/battery-notif.service";
  	  "systemd/user/battery-notif.timer" = "systemd/user/battery-notif.timer";
    };
    in

{
    home.username = "tquilla";
    home.homeDirectory = "/home/tquilla";
    programs.git.enable = true;
    home.stateVersion = "25.05";

   xdg.configFile = builtins.mapAttrs (name: subpath: {source = 
  	create_symlink "${dots}/config/${subpath}";
  	recursive = true;
   }) configs;	


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
