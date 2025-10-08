{ pkgs, services, ...  }:

{
  services = {
    xserver = {
        enable = true;
        windowManager = {
            bspwm.enable = true;
        };
        autoRepeatDelay = 300;
        autoRepeatInterval = 35;
#       videoDrivers = [ "intel" "modesetting" ];
        videoDrivers = [ "modesetting" ];
        displayManager = {
        	lightdm.greeters.tiny.enable = true;
        };
    };
    
#   displayManager = {
#       autoLogin.enable = true;
#       autoLogin.user = "whiskey";
#   };
  };
}
