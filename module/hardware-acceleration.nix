{ systems, ... }:
{
	hardware.opengl = {
	  enable = true;
	  driSupport = true;
	  driSupport32Bit = true;
	  extraPackages = with pkgs; [
	    intel-media-driver # Untuk GPU Intel generasi baru (Iris Xe, UHD 620+)
	    vaapiIntel         # Untuk GPU lama
	    libvdpau-va-gl
	  ];
	};
}
