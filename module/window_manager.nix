{}:

{
  services = {
    xserver = {
        enable = true;
        windowManager = {
#           dwl = {
#               enable = true;
#           };
            bspwm = {
                enable = true;
            };
        };

        autoRepeatDelay = 300;
        autoRepeatInterval = 35;
        videoDrivers = [ "intel" "modesetting" ];
        displayManager = {
            lightdm.enable = true;
        };
    };
    
#   displayManager = {
#       autoLogin.enable = true;
#       autoLogin.user = "whiskey";
#   };
  };
}
