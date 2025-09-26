{pkgs, ... }:

{
  home.packages = with pkgs; [
	(pkgs.st.overrideAttrs (_: {
		src = ../user/tquilla/config/st;
		patches = [ ];
	}))
    (pkgs.dmenu.overrideAttrs (_: {
        src = ../user/tquilla/config/dmenu;
        patches = [ ];
    }))
	slock
	surf
  ];
}
