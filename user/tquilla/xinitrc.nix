{
  xsession = {
    enable = true;

    # Window Manager yang dipanggil setara dengan "exec bspwm"
    windowManager.command = "bspwm";

    # Tambahan script sebelum menjalankan WM (setara isi .xinitrc kamu)
    initExtra = ''

    '';
  };
}
