{ pkgs, ... }:

{
  config = {
    fonts = {
      enableDefaultPackages = true;

      fontconfig = {
        enable = true;

        defaultFonts = {
          # Monospace → fokus buat coding & terminal
          monospace = [
            "JetBrainsMono Nerd Font"
            "FiraCode Nerd Font"
            "Hack Nerd Font"
            "Source Code Pro"
            "DejaVu Sans Mono"
            "Unifont"
          ];

          # Sans Serif → buat UI & desktop
          sansSerif = [
            "Noto Sans"
            "Roboto"
            "DejaVu Sans"
            "Cantarell"
            "Unifont"
          ];

          # Serif → buat dokumen / teks klasik
          serif = [
            "Noto Serif"
            "Liberation Serif"
            "DejaVu Serif"
            "Unifont"
          ];

          # Emoji → emoji + ikon
#          emoji = [
#            "Noto Color Emoji"
#            "Font Awesome"
#            "Material Design Icons"
#            "Unifont"
#          ];
        };
      };

      packages = with pkgs; [
        # Font universal / fallback
        unifont
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        noto-fonts-extra

        # Monospace (coding / terminal)
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-code
        nerd-fonts.hack
        source-code-pro

        # UI / desktop
        roboto
        cantarell-fonts
        liberation_ttf

        # Icons & Emoji
        font-awesome
        material-design-icons
        dejavu_fonts
      ];
    };
  };
}
