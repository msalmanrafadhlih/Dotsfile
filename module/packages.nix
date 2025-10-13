{ config, pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      # stable packages
      fastfetch
      rofi
      gimp
      vivaldi
      nushell
      tmux

      nixpkgs-fmt
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

