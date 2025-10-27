{ config, pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      # stable packages
      fastfetch
      rofi
      gimp
      vivaldi
      tmux

      nixpkgs-fmt
#      daktilo
	  vscode
      nodejs
      feh
      gcc

      font-manager
      picard      
      jellyfin-ffmpeg
	  ungoogled-chromium
	  libreoffice	  
	  zoom
	  evince
	  obs-studio
	  flameshot
    ])
    ++ (with pkgs.unstable; [
      # unstable packages
      helix
      ani-cli
      yt-dlp
      timg
      vesktop
      kdocker
      yazi
      rmpc
      kitty
      geany
    ]);
}

