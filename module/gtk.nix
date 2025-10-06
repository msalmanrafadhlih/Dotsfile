{ config, pkgs, ... }:

{
	## DBUS SESSION
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

	## XDG PORTAL (X11 Only)
	xdg.portal = {
		enable = true;
		xdgOpenUsePortal = true;
		extraPortals = with pkgs; [
		  xdg-desktop-portal-gtk
		];
		config = {
		  common = {
		    default = [ "gtk" ];
		  };
		};
	};

	environment.sessionVariables = {
		XDG_CURRENT_DESKTOP = "gtk";
		XDG_SESSION_TYPE = "x11";
	};

	xdg.mime.enable = true;
	xdg.mime.defaultApplications = {
		# Set default browser for web links
		"x-scheme-handler/http" = "firefox.desktop";
		"x-scheme-handler/https" = "firefox.desktop";

		# Set default image viewer for various image types
		"image/png" = "qview.desktop";
		"image/jpeg" = "qview.desktop";
		"image/svg+xml" = "qview.desktop";
	};

	# Make sure the application packages are installed
	environment.systemPackages = with pkgs; [
		qview
	];
}
