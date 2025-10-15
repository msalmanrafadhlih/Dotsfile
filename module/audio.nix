{ pkgs, lib, ... }:

{
  hardware.alsa.enable = true;
  hardware.enableAllFirmware = true;

  # Nonaktifkan PulseAudio lama
  services.pulseaudio.enable = false;

  # Aktifkan PipeWire sepenuhnya
  services.pipewire = {
    enable = true;
    alsa.enable = true;          # PipeWire handle ALSA
    alsa.support32Bit = true;
    pulse.enable = true;         # Gantikan PulseAudio
    jack.enable = true;          # Buat kompatibilitas Jack apps
  };

  # Tambahkan tools berguna
  environment.systemPackages = with pkgs; [
    pavucontrol
    alsa-utils
    pw-cli
    pipewire
    wireplumber
  ];
}
