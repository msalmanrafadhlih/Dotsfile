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

  	font-manager
  	yt-dlp
  	ncmpcpp
  		
  ])  ++ (with nixpkgs-unstable.legacyPackages.x86_64-linux; [
  ]);
}
