{ config, pkgs, ... }:

{
  
  home.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "brave";
    TERMINAL = "ghostty";
  };

  xsession = {
    enable = true;
    windowManager.command = "bspwm";
    
    # Tambahan script sebelum menjalankan WM (setara isi .xinitrc kamu)
    initExtra = ''
	    eval "$(dbus-launch --sh-syntax)"
	    export DBUS_SESSION_BUS_ADDRESS
	    
		export XCURSOR_THEME=Doro
		export XCURSOR_SIZE=20
		xsetroot -cursor_name left_ptr

    '';
  };
  
}
