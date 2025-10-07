{ inputs, pkgs, ... }:

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
}
