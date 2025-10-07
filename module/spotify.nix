{ inputs, pkgs, services, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
	  enable = true;

	  enabledExtensions = with spicePkgs.extensions; [
	    adblock
	  ];
	  enabledCustomApps = with spicePkgs.apps; [
	    newReleases
	    reddit
	  ];
	  enabledSnippets = with spicePkgs.snippets; [
	    rotatingCoverart
	    pointer
	  ];

	  theme = spicePkgs.themes.dreary;
	  colorScheme = "Psycho";
  };

  services.spotifyd = {
    enable = true;
    package = pkgs.spotifyd;
    settings = {
      global = {
        username_cmd = "cat ~/.config/spotify/username";
        password_cmd = "cat ~/.config/spotify/credentials";
        backend = "alsa"; # atau "alsa" kalau kamu pakai ALSA saja
        use_mpris = true;
        device_name = "NixOS-Spotify";
        bitrate = 160;
        volume_normalisation = true;
      };
    };
  };
}
