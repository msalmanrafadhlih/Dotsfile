{ config, pkgs, ... }:

{
  
  home.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "brave";
    TERMINAL = "alacritty";
  };

  xsession = {
    enable = true;
    windowManager.command = "bspwm";
    
    # Tambahan script sebelum menjalankan WM (setara isi .xinitrc kamu)
    initExtra = ''
	    eval "$(dbus-launch --sh-syntax)"
	    export DBUS_SESSION_BUS_ADDRESS
	    
    '';
  };
  
}
