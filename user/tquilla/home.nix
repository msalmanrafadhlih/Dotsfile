{ config, pkgs, libs, ... }:

  let
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    home = config.home.homeDirectory;
    dots = "/etc/nixos/dots";

#	~/.config
    configs = {    
		bspwm = "bspwm";
  		alacritty = "alacritty";
  		polybar = "polybar";
		sxhkd = "sxhkd";
		nano = "nano";
		ghostty = "ghostty";
		picom = "picom";
		st = "st";
		nvim = "nvim";
		tmux = "tmux";
		dunst = "dunst";
		dmenu = "dmenu";
		
  	  	"systemd/user/battery-notif.service" = "systemd/user/battery-notif.service";
  	  	"systemd/user/battery-notif.timer" = "systemd/user/battery-notif.timer";
  	  	"git/git-prompt.sh" = "git/git-prompt.sh";
    };

    locals = {
    	".icons" = "icons";
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
   
   home.file = builtins.mapAttrs (name: subpath: {source = 
  	create_symlink "${dots}/config/${subpath}";
  	recursive = true;
   }) locals;	
   
   imports = [
  	./bash.nix
  	./packages.nix
  	./bat.nix
  	./xsession.nix	
  	./battery.nix
  	./brightness.nix
  	./toggle_touchpad.nix
  	./volume.nix
  	./media.nix
  	./nanorc.nix
  	./mpd.nix
  	./git-prompt.nix
  	./tar.nix
  	./xyz.nix
  	./hide-polybar.nix
  	./show-polybar.nix
  	./background.nix
  	./opencam.nix
   ];
	
}
