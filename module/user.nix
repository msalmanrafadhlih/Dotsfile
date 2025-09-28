{ users, ... }:

{
    users.users = {
        whisky = {
          isNormalUser = true;
          extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
        };

        tquilla = {
          isNormalUser = true;
          extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
        };
    };
}
