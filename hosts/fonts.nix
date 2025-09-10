{ config, lib, pkgs, ... }:

{
  config = {
    fonts = {
      enableDefaultPackages = true;

      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [ "FiraCode Nerd Font" "JetBrainsMono Nerd Font" ];
          sansSerif = [ "Noto Sans" "DejaVu Sans" ];
          serif = [ "Noto Serif" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };

      packages = with pkgs; [
        # Font dasar
        dejavu_fonts
        liberation_ttf
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji

        # Monospace populer
        jetbrains-mono
        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono

        # Untuk Polybar / Rofi / terminal (ikon glyph)
        font-awesome
        material-design-icons
        termsyn

        # Tambahan opsional (bisa dipilih)
        nerd-fonts.hack
        nerd-fonts.ubuntu-mono
        nerd-fonts.sauce-code-pro
      ];
    };
  };
}
