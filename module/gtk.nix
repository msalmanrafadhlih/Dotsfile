{ pkgs, ... }

{
	services = {
		dbus.enable = true;
		udisks2.enable = true;
		gvfs = {
	        enable = true;
	        package = pkgs.gnome.gvfs;
	    };

	    dbus.packages = with pkgs; [
	        dconf
	    ];
	};
	programs.dconf.enable = true
	xdg.portal.enable = true;
	
	xdg.portal.extraPortals = [ 
		pkgs.xdg-desktop-portal-gtk 
	];
}
