{ config, pkgs, libs, ... }:

  let
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    home = config.home.homeDirectory;
    system = "/home/tquilla/.repos/nixos/system";

#	~/.config
    configs = {    
		dwm = "dwm";
		
#  	  	"systemd/user/battery-notif.service" = "systemd/user/battery-notif.service";
    };

#    locals = {
#    	".icons" = "icons";
#    };
    in

{
    home.username = "tquilla";
    home.homeDirectory = "/home/tquilla";
    programs.git.enable = true;
    home.stateVersion = "25.05";

   xdg.configFile = builtins.mapAttrs (name: subpath: {source = 
  	create_symlink "${system}/config/${subpath}";
  	recursive = true;
   }) configs;	
   
   home.file = builtins.mapAttrs (name: subpath: {source = 
  	create_symlink "${system}/config/${subpath}";
  	recursive = true;
   }) locals;
   
	imports = {
		./services.nix
		./module/programs.nix
		./module/system-packages.nix
		./module/fonts.nix
	];
}
