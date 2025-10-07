{ systems, pkgs, ... }:
{
	hardware.graphics = {
	  enable = true;
	  enable32Bit = true;
	  extraPackages = with pkgs; [
	    intel-media-driver  # driver modern untuk iGPU Intel (UHD/Iris)
	    vaapiIntel          # fallback untuk GPU Intel lama
	    libvdpau-va-gl      # kompatibilitas VDPAU (opsional tapi aman)
	  ];
	};
}
