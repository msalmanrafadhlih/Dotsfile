{ inputs, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;

    # pilih paket Firefox
    package = pkgs.firefox-unwrapped;

    # pasang ekstensi
#    profiles
#    extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
#      ublock-origin
#      bitwarden
#      # textfox (kalau tersedia di NUR)
#    ];

    # about:config preferences
    preferencesStatus = "user";
    preferences = {
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

    # policies.json equivalent (bisa enforce policy Mozilla)
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DontCheckDefaultBrowser = true;
    };
  };
}
