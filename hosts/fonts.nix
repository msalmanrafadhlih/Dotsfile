{ config, lib, pkgs, ... }:

{
  config = {
	fonts = {
	
		enableDefaultPackages = true;
		fontconfig = {
			enable = true;
			defaultFonts = {
				monospace = [ "FiraCode Nerd Font" ];
				sansSerif = [ "Noto Sans" ];
				serif = [ "Noto Serif" ];
				emoji = [ "Noto Color Emoji" ];
			};
		};

		## FONTS PACKAGES
		packages = with pkgs;
		[
			jetbrains-mono
			# Font dasar
			dejavu_fonts
			liberation_ttf
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-emoji

			# Untuk polybar, rofi, terminal (ikon glyph)
			nerdfonts

			# (opsional) tambahan lain
			font-awesome
			material-design-icons
			termsyn
		];
	};
  };
}
