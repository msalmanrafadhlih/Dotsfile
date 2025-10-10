# ../module/locals.nix

let
  apps = [
    "discord"
    "org.pulseaudio.pavucontrol"
    "picom"
    "rmpc"
    "rofi"
    "rofi-theme-selector"
    "spotify"
    "st"
    "thunar"
    "thunar-bulk-rename"
    "thunar-settings"
    "vesktop"
    "vivaldi-stable"
  ];

  appMappings =
    builtins.listToAttrs (map (name: {
      name = ".local/share/applications/${name}.desktop";
      value = "Apps/${name}.desktop";
    }) apps);
in
{
  ".icons" = "Assets/cursors";
  "Pictures/iconApps" = "Assets/IconApps";
  "Pictures/Wallpaper" = "Assets/Wallpaper";
  "zsh/.zZ" = ".config/zsh/zcompdump";
} // appMappings
