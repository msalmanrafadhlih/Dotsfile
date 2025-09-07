{ config, pkgs, nixpkgs-unstable, pkgs-stable, ... }:

{
  home.packages = (with pkgs; [
        # stable version
	fastfetch
	vivaldi
	brave
	nixpkgs-fmt
	nodejs
	gcc	
        ])  ++ (with nixpkgs-unstable.legacyPackages.x86_64-linux; []);
}
