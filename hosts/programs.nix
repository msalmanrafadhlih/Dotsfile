{ programs, libs, pkgs, ... }:

{
  programs = {
  
	thunar = {
		enable = true;
		plugins = with pkgs.xfce; [
			thuna-volman
			thunar-dropbox-plugin
			thunar-vcs-plugin
			thunar-archive-plugin
			thunar-media-tags-plugin
		]
	};
	
  };
}
