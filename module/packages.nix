{ config, pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      # stable packages
      fastfetch
      spotify
      rofi
      vivaldi
      tmux
      feh

      nixpkgs-fmt
      nodejs
      surf
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
      spicetify-cli
      vesktop
      kdocker
      yazi
      rmpc
      kitty
      geany
    ]);
}

