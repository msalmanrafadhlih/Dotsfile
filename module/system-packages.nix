
{ config, lib, pkgs, ... }:

{ 
   environment.systemPackages = with pkgs; [
      # BSPWM Stuff
      polybarFull
      sxhkd
      picom
      eww
 
      ungoogled-chromium
      wget
      btop
      git
      tree
      bat
 
      killall
      unzip
      imlib2
      python3
      xorg.xinit
      xorg.xsetroot
      xorg.xrandr
      xorg.xinput

      brightnessctl
      libcanberra-gtk3
      sound-theme-freedesktop
      playerctl
      pamixer
      xdotool
      xarchiver
      mpv
      acpi
      dunst
      # AUDIO
   ];
}
