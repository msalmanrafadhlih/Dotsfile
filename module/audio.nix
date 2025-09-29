{ ... }:

{
	sound.enable = true;
	
	hardware.pulseaudio.enable = false;
	hardware.pulseaudio.support32Bit = false;
	
	services.pipewire = {
		enable = true;
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
