{ services, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx"; # gunakan OpenGL backend
    vSync = true;
    shadow = true;
    fade = true;
    inactiveOpacity = 0.95;
  };
}
