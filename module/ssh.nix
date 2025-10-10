{ services, ... }:

{
	services.openssh.enable = true;
#	services.tailscale.enable = true;	
	services.openssh = {
		startWhenNeeded = true;
		settings.PasswordAuthentication = true;
		settings.PermitRootLogin = "no";
		settings.KbdInteractiveAuthentication = true;
	};
	networking.firewall = {
		enable = true;
#		allowedTCPPorts = [ 22 ];
	};
	## using mosh
	programs.mosh.enable = true;
}
