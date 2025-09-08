

{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  networking.networkmanager.enable = true;
  networking.hostName = "nixos";
  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
	font = "Lat2-Terminus16";
	keyMap = "us";
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver = {
	enable = true;
	autoRepeatDelay = 200;
	autoRepeatInterval = 35;
	videoDrivers = [ "intel" "modesetting" ];
	
	# WINDOW MANAGER
	windowManager.bspwm.enable = true;
	displayManager.lightdm.enable = true;
  };

 services.libinput = {
	enable = true;
	touchpad = {
		tapping = true;
		naturalScrolling = true;
		disableWhileTyping = true;
	};	
 };



  services.pipewire = {
     	enable = true;
     	pulse.enable = true;
  };

  nix.gc = {
  	automatic = true;
  	dates = "daily";
  	options = "--delete-older-than 3d";
  };

  users.users.tquilla = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
  };
  
  environment.systemPackages = with pkgs; [
	# BSPWM Stuff
	polybar
	sxhkd
	picom
	dmenu
	xfce.thunar

	alacritty
	feh
  	vim
  	wget
	btop	
	git
	tree
	bat

	killall	
	xwallpaper
	xorg.xinit
	xorg.xsetroot
	xorg.xrandr
  ];

  fonts.packages = with pkgs; [
	jetbrains-mono
  ];

  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

