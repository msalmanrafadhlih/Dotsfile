{ config, pkgs, nixpkgs-unstable, pkgs-stable, ... }:

{
  home.packages = (with pkgs; [
        # stable version
	fastfetch
#	spotify-tui
	rofi
	geany
	vivaldi
	neovim
	brave
	tmux
	feh
	
	nixpkgs-fmt
	nodejs
	gcc

	rmpc
  	font-manager
  	vesktop
  	yt-dlp
  	jellyfin-ffmpeg
  ])  ++ (with nixpkgs-unstable.legacyPackages.x86_64-linux; [
  ]);
}
