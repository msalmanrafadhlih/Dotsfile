{ inputs, pkgs, extensions, apps, snippets, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
	  enable = true;

	  enabledExtensions = with spicePkgs.extensions; [
	    adblock
	    hidePodcasts
	    shuffle
	  ];
	  enabledCustomApps = with spicePkgs.apps; [
	    newReleases
	    ncsVisualizer
	  ];
	  enabledSnippets = with spicePkgs.snippets; [
	    rotatingCoverart
	    pointer
	  ];

	  theme = spicePkgs.themes.dribbblish;
#	  colorScheme = "mocha";
  }
}
