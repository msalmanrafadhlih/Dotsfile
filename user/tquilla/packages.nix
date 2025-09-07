{ config, pkgs, nixpkgs-unstable, pkgs-stable, ... }:

{
  home.packages = (with pkgs; [
        # stable version
	vivaldi
	brave
	nixpkgs-fmt
	nodejs
	gcc	
	fastfetch
        ])  ++ (with nixpkgs-unstable.legacyPackages.x86_64-linux; []);
}
