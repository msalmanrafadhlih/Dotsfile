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

	rmpc
  	font-manager
  	yt-dlp
  ])  ++ (with nixpkgs-unstable.legacyPackages.x86_64-linux; [
  ]);
}
