{ inputs, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

	# Pilih paket Firefox yang dipakai
	# package = pkgs.firefox; 
	# package = pkgs.firefox-esr;
	package = pkgs.firefox-unwrapped;
  
    profiles.default = {
      # Ekstensi Firefox
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          # ganti ini dengan nama paket textfox jika ada di NUR, 
          # atau pasang manual jika bukan dari NUR
          # textfox
        ];
      };

      # Settings bawaan (about:config values)
      settings = {
        ## === Privacy & Tracking ===
        "privacy.resistFingerprinting" = true;
        "privacy.firstparty.isolate"   = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.donottrackheader.enabled" = true;

        ## === Telemetry & Data Collection ===
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;

        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;

        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;

        ## === Misc UI ===
        "browser.startup.homepage" = "https://search.nixos.org";
        "browser.shell.checkDefaultBrowser" = false;
        "browser.disableResetPrompt" = true;
        "signon.rememberSignons" = false;
      };
    };
  };

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
