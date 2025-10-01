{ pkgs, ... }:

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
	programs.dconf.enable = true;
	
	xdg.portal.enable = true;
	xdg.portal.xdgOpenUsePortal = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	xdg.portal.configPackages = [
	  pkgs.gnome-session
	  pkgs.xdg-desktop-portal-gtk
	];
	
    xdg.portal.config = {
	  common = {
	    default = [ "gtk" ];
	  };
	  pantheon = {
	    default = [ "pantheon" "gtk" ];
	    "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
	  };
	  x-cinnamon = {
	    default = [ "xapp" "gtk" ];
	  };
	};
}
