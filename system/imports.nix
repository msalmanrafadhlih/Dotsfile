{ config, pkgs, libs, ... }:

{
   
	imports = [
		./module/services.nix
		./module/programs.nix
		./module/system-packages.nix
		./module/fonts.nix
	];
}
