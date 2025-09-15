
{ config, lib, pkgs, ... }:

{ 
   environment.systemPackages = with pkgs; [
      # BSPWM Stuff
      polybarFull
      sxhkd
      picom
      dmenu
      xfce.thunar
 
      nodePackages.prettier
      qutebrowser
      alacritty
      feh
      vim
      wget
      btop
      git
      tree
      bat
 
      killall
      unzip
      xwallpaper
      xorg.xinit
      xorg.xsetroot
      xorg.xrandr
      xorg.xinput

      brightnessctl
      libcanberra-gtk3
      sound-theme-freedesktop
      pamixer
      xdotool
      acpi
      libnotify
      mpc
      dunst
      # AUDIO
   ];
}
