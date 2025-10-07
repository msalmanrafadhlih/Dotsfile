{ pkgs, ... }:

{
  services.tlp.enable = true;
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
}
