{ config, pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      # stable packages
      fastfetch
      android-studio
      rofi
      gimp
      vivaldi
      tmux

      nixpkgs-fmt
#      daktilo
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
      neovim
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

