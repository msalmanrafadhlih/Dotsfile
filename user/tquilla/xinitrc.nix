{
  xsession = {
    enable = true;

    # Window Manager yang dipanggil setara dengan "exec bspwm"
    windowManager.command = "bspwm";
	
    # Tambahan script sebelum menjalankan WM (setara isi .xinitrc kamu)
    initExtra = ''
	    eval "$(dbus-launch --sh-syntax)"
	    export DBUS_SESSION_BUS_ADDRESS
	    
    '';
  };
}
