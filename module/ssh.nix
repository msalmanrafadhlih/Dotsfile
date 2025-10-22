{ services, ... }:

{
	services.openssh.enable = true;
	services.tailscale.enable = true;
	services.openssh = {
		startWhenNeeded = true;
		settings.PasswordAuthentication = true;
		settings.PermitRootLogin = "no";
		settings.KbdInteractiveAuthentication = true;
	};
	networking.firewall = {
		enable = false;
		allowedTCPPorts = [ 22 ];
		allowedUDPPorts = [ 60000 60001 60002 60003 60004 60005 60006 60007 60008 60009 60010 ];
	};
	## using mosh
	programs.mosh.enable = true;
}
