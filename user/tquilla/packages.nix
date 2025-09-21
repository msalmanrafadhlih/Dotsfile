{ config, pkgs, nixpkgs-unstable, pkgs-stable, ... }:

{
  home.packages = (with pkgs; [
        # stable version
	fastfetch
	vivaldi
	brave
	neovim
	tmux
	
	nixpkgs-fmt
	nodejs
	gcc

	ncmpcpp
  	font-manager
  	yt-dlp
  	jellyfin-ffmpeg
  ])  ++ (with nixpkgs-unstable.legacyPackages.x86_64-linux; [
  ]);
}
