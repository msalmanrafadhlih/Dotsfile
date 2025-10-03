{ services, ... }:

{
	services.openssh.enable = true;
	services.tailscale.enable = true;	
	services.openssh = {
		startWhenNeeded = true;
		settings.PasswordAuthentication = false;
		permitRootLogin = "no";
		settings.KbdInteractiveAuthentication = false;
	};
	networking.firewall = {
		enable = true;
		allowedTCPPorts = [ 22 ];
	};
}
