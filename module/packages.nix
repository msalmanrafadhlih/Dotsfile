{ config, pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      # stable packages
      fastfetch
      rofi
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
    ])
    ++ (with pkgs.unstable; [
      # unstable packages
      geany
    ]);
}

