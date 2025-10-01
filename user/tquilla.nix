{ config, pkgs, libs, ... }:

  let
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    home = config.home.homeDirectory;
    dots = "/home/tquilla/.repos/nixos";

#	~/.config
    configs = {    
		bspwm = "bspwm";
  		polybar = "polybar";
		sxhkd = "sxhkd";
		nano = "nano";
		rofi = "rofi";
		picom = "picom";
		st = "st";
		nvim = "nvim";
		tmux = "tmux";
		rmpc = "rmpc";
		fastfetch = "fastfetch";
		ncmpcpp = "ncmpcpp";
		zsh = "zsh";
		bat = "bat";
		btop = "btop";
		dunst = "dunst";
		eww = "eww";
		geany = "geany";
		yazi = "yazi";
		
#  		alacritty = "alacritty";		
#		ghostty = "ghostty";		
#		dmenu = "dmenu";
#		dwm = "dwm";

#		"gtk-3.0" = "gtk-3.0";
		"vesktop/themes" = "vesktop";
  	  	"systemd/user/battery-notif.service" = "systemd/user/battery-notif.service";
  	  	"systemd/user/battery-notif.timer" = "systemd/user/battery-notif.timer";
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
  	../module/bash.nix
  	../module/packages.nix
  	../module/bat.nix
  	../module/xsession.nix
  	../module/battery.nix
  	../module/brightness.nix
  	../module/volume.nix
  	../module/media.nix
  	../module/nanorc.nix
  	../module/git-prompt.nix
  	../module/tar.nix
  	../module/xyz.nix
  	../module/hide-polybar.nix
  	../module/show-polybar.nix
  	../module/background.nix
  	../module/opencam.nix
  	../module/bookmarks.nix
  	../module/github-repos.nix
  	../module/tmux-sessions.nix
  	../module/run.nix
  	../module/mpd.nix
#  	../module/suckless.nix  	
   ];
}
