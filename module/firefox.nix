{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
	package = {}

    # pasang ekstensi
    profiles.default.extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
      # textfox (kalau tersedia di NUR)
    ];
  };
  
  ## TEXTFOX
  textfox = {
      enable = true;
      profile = "textfox";
      config = {
        background = {
#          color = "transparent";
          color = "#c80e15";
        };
        border = {
        color = "#f3e2e2";       
        width = "3px";           
        transition = "0.3s ease"; # Snappier animation
        radius = "6px";
        };
        tabs.horizontal.enable = false;
        tabs.vertical.enable = true;
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
          accent = "#f2e9e9"; # Warm gold accent
        };
        tabs.vertical = {
          margin = "0.8rem";
        };
      };
  };
}
