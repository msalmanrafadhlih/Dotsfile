{ pkgs, ... }:

{
  config = {
    fonts = {
      enableDefaultPackages = true;

      fontconfig = {
        enable = true;
	    antialias = true;
	    hinting.enable = true;
	    hinting.style = "full"; # bisa: none, slight, medium, full
	    subpixel.rgba = "rgb";  # untuk layar LCD biasanya rgb
		fonts.fontconfig.dpi = 120; # default 96, atur sesuai kebutuhan
		
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
