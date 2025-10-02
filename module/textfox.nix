{ pkgs, inputs, lib, ... }:

{
## TEXTFOX
  textfox = {
      enable = true;
      profile = "textfox";
      config = {
        background = {
          color = "#141414";
        };
        border = {
        color = "#8c6239";        # Warm brown-gold accent
        width = "3px";            # Slimmer border for elegance
        transition = "0.3s ease"; # Snappier animation
        radius = "6px";
        };
        tabs.horizontal.enable = false;
        displayWindowControls = true;
        displayNavButtons = true;
        displayUrlbarIcons = true;
        displaySidebarTools = false;
        displayTitles = false;
        newtabLogo = "
        ⠀⠀⠀⠀⠀⣀⣤⣴⣶⣶⣤⣄⠀⠀⠀⠀⠀
        ⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀
        ⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀
        ⢸⣿⣿⣿⣿⣿ Textfox ⣿⣿⣿⣿⡇
        ⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀
        ⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀
        ⠀⠀⠀⠀⠈⠉⠛⠛⠉⠉⠀
        ";
        font = {
          family = "jetBrainsMono Nerd Font";
          size = "12px";
          accent = "#d4a373"; # Warm gold accent
        };
        tabs.vertical = {
          margin = "0.8rem";
        };
      };
  };
}
