{ config, lib, pkgs, ... }:

{
  config = {
  	fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs;
      [
      	jetbrains-mono
        dejavu_fonts
        freefont_ttf
        gyre-fonts
        liberation_ttf
        unifont
        font-awesome
        material-design-icons
        unifont
        noto-fonts
        termsyn
        noto-fonts-color-emoji
      ];
  };
}
