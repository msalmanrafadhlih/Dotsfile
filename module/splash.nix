{ boot, ... }:

{
  boot = {
    plymouth = {
        enable = true;
    };
    consoleLogLevel = 0; # set level log kernel (0=sepi, 7=verbose)
    initrd.verbose = false; # matikan output initrd
    kernelParams = [ "quiet" "loglevel=3" "rd.systemd.show_status=0" "udev.log_level=3" ];
  };
}
