{ libs, config, pkgs, ... }:

{
	fonts.packages = with pkgs; [
		jetbrains-mono
		noto-fonts
		unifont
		fontawesome-free
		material-design-icons
		termsynu
  	];
}
