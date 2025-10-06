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
      nodejs
      feh
      gcc

      font-manager
      picard      
      yt-dlp
      jellyfin-ffmpeg
    ])
    ++ (with pkgs.unstable; [
      # unstable packages
      nyaa
      neovim
      vesktop
      kdocker
      yazi
      rmpc
      kitty
      geany
    ]);
}

