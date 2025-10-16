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
      yt-dlp
      jellyfin-ffmpeg
	  ungoogled-chromium
    ])
    ++ (with pkgs.unstable; [
      # unstable packages
      neovim
      timg
      vesktop
      kdocker
      yazi
      rmpc
      kitty
      geany
    ]);
}

