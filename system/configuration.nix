{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		./imports.nix
		./services.nix
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
	
	nix.gc = {
		automatic = true;
		dates = "daily";
		options = "--delete-older-than 3d";
	};

	users.users.tquilla = {
		isNormalUser = true;
		extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
	};

	security.rtkit.enable = true;
	system.stateVersion = "25.05";
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

