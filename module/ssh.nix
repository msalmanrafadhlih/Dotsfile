{ services, ... }:

{
	services.openssh.enable = true;
#	services.tailscale.enable = true;	
	services.openssh = {
		startWhenNeeded = true;
		settings.PasswordAuthentication = false;
		settings.PermitRootLogin = "no";
		settings.KbdInteractiveAuthentication = false;
	};
	networking.firewall = {
		enable = false;
#		allowedTCPPorts = [ 22 ];
	};
}
