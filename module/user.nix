{ users, ... }:

{
    users.users = {
        whiskey = {
          isNormalUser = true;
          extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
          initialPassword = "SALMANCUA";
        };

        tquilla = {
          isNormalUser = true;
          extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
        };
    };
}
