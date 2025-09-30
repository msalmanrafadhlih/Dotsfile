{ pkgs, lib, ... }:

{
	
	hardware.alsa.enable = true;
	hardware.enableAllFirmware = true;
	services.pulseaudio.enable = false;
	
	services.pipewire = {
		enable = lib.mkForce true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};
	
	environment.systemPackages = with pkgs; [
		pavucontrol
		alsa-utils
	];
}
