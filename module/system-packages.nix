
{ config, lib, pkgs, ... }:

{ 
   environment.systemPackages = with pkgs; [
      # BSPWM Stuff
      polybarFull
      sxhkd
      picom
      eww
 
      nodePackages.prettier
      wget
      btop
      git
      tree
      bat
 
      killall
      unzip
      imlib2
      xorg.xinit
      xorg.xsetroot
      xorg.xrandr
      xorg.xinput

      brightnessctl
      libcanberra-gtk3
      sound-theme-freedesktop
      pamixer
      xdotool
      xarchiver
      mpv
      acpi
      dunst
      # AUDIO
   ];
}
