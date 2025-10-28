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
    "discord"
    "vivaldi-stable"
    "ChatGPT"
    "Gemini"
    "Claude"
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
  ".config/zsh/.nomedia" = "zsh/zcompdump";
  ".local/share/asciiart" = "asciiart";
} // appMappings
