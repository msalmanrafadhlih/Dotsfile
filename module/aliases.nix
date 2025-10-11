# ./aliases.nix

{
tquilla = "cat ~/.config/fastfetch/ascii/miku";
NIXOS = "tree ~/.repos/nixos && cd ~/.repos/nixos";
RUNNING = "systemctl --user list-units --state=running";
SYSRUNNING = "systemctl list-units --state=running";
USAGELOG = "sudo journalctl --disk-usage";

##  SYSTEM CONFIGURATIONS
HOSTS = "cd ~/.repos/nixos/host && tree ~/.repos/nixos/host";
NIX = "nano ~/.repos/nixos/system/configuration.nix";
HNIX = "bat ~/.repos/nixos/system/hardware-configuration.nix";
FLAKE = "nano ~/.repos/nixos/flake.nix";
LOCK = "bat ~/.repos/nixos/flake.lock";

FONTS = "nano ~/.repos/nixos/module/fonts.nix";
SYSINSTALL = "nano  ~/.repos/nixos/module/system-packages.nix";
SERVICE = "nano  ~/.repos/nixos/module/services.nix";
SPLASH = "~/.repos/nixos/module/splash.nix";


## GIT INTEGRATION
GIT = "git add . && git commit -m";
CLASS = "xprop | grep CLASS";
NAME = "xprop | grep NAME";
GRAPH = "git log --oneline --decorate --graph --all";

##  USER CONFIGURATIONS {EDIT}
MDL = "cd ~/.repos/nixos/module && ls -la";
HOME = "cd ~/.repos/nixos/user && nano ~/.repos/nixos/user/$USER.nix ";
ALIAS = "nano ~/.repos/nixos/module/aliases.nix";
BASH = "nano ~/.repos/nixos/module/bash.nix";
ZSH = " nano ~/.repos/nixos/module/zshrc.nix";
INSTALL = "nano ~/.repos/nixos/module/packages.nix";
BAT = "nano ~/.repos/nixos/module/bat.nix";
XSESSION = "nano ~/.repos/nixos/module/xsession.nix";
PAD = "nano ~/.repos/nixos/module/toggle_touchpad.nix";
VOL = "nano ~/.repos/nixos/module/volume.nix";
BRIGHT = "nano ~/.repos/nixos/module/brightness.nix";
BAT0 = "nano ~/.repos/nixos/module/battery.nix";
NANO = "nano ~/.repos/nixos/module/nanorc.nix";
MPD = "nano ~/.repos/nixos/module/mpd.nix";
BRANCH = "nano ~/.repos/nixos/module/git-prompt.nix";
TAR = "nano ~/.repos/nixos/module/tar.nix";
BG = "nano ~/.repos/nixos/module/background.nix";
OPENCAM = "nano ~/.repos/nixos/module/opencam.nix";
BOOKMARK = "nano ~/.repos/nixos/module/bookmarks.nix";
REPOS = "nano ~/.repos/nixos/module/github-repos.nix";
TMUXSESSION = "nano ~/.repos/nixos/module/tmux-sessions.nix";
LOCAL = "nano ~/.repos/nixos/module/locals.nix";
SSH = "nano ~/.repos/nixos/module/ssh.nix";

##  USER CONFIGURATIONS {SAVE}
UTILS = "chmod +x ~/.local/bin/*.sh";

## LINK BOOKMARKS
PERSONAL = "nano ~/.config/bookmarks/personal.txt";
WORK = "nano ~/.config/bookmarks/work.txt";


##  DOTSFILE CONNFIGURATION & BSPWM
CONFIG = "tree ~/.repos/nixos/config && cd ~/.repos/nixos/config";
POLYMODULE = "tree ~/.repos/nixos/config/polybar/modules && cd ~/.repos/nixos/config/polybar/modules";
POLYSCRIPT =  "cd ~/.repos/nixos/config/polybar/script && tree";

TMUX = "nano ~/.repos/nixos/config/tmux/tmux.conf";
ER = "nano ~/.repos/nixos/config/bspwm/src/ExternalRules";
BSPWM = "nano ~/.repos/nixos/config/bspwm/bspwmrc";
SXHKD = "nano ~/.repos/nixos/config/sxhkd/sxhkdrc";
POLY = "nano ~/.repos/nixos/config/polybar/config.ini";
ALAC = "nano ~/.repos/nixos/config/alacritty/alacritty.toml";
DUNST = "nano ~/.repos/nixos/config/dunst/dunstrc";
CURSOR = "nano ~/.icons/default/index.theme";
PCOM = "nano ~/.repos/nixos/config/picom/picom.conf";
ANIMA = "nano ~/.repos/nixos/config/picom/picom-animations.conf";
POWERMENU = "nano ~/.repos/nixos/config/rofi/files/powermenu/type-4/style-1.rasi";
ROFI = "nano ~/.repos/nixos/config/rofi/files/launchers/type-7/style-4.rasi";

## Suckless Stuff
SUCKPULL = "mv config.h config.h.bak && git pull";
NSHELL = "cd shell && nix-shell && cd ..";
PATCH = "patch -p1 <";
STCONF = "cd ~/.repos/nixos/config/st  && nano config.h";
DMENUCONF = "cd ~/.repos/nixos/config/dmenu && nano config.h";
SLOCKCONF = "cd ~/.repos/nixos/config/slock && nano config.h";
CONFSAVE = "mv config.h config.h.bak";
CONFDEL = "cp config.h.bak config.h";
MAKE = "make clean && make && make install PREFIX=$HOME/.local";
SUCKLESS = "nano ~/.repos/nixos/module/suckless.nix";

## Tmux
TMUXSAVE = "tmux source-file ~/.config/tmux/tmux.conf";
TMUXDEL = "tmux kill-server";

##  OTHER
BASHSAVE = "source ~/.bashrc && dunstify 'BASHRC saved'";
ZSHSAVE = "source ~/.zshrc && dunstify 'ZSHRC saved'";
SAVEFLAKE = "sudo nixos-rebuild switch --flake ~/.repos/nixos#nixos";

OLD = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
GBGOLD = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +3";
GBG = "nix-collect-garbage";
OPTIMISE = "nix-store --optimise";
GC = "nix-store --gc";
CLEANER = "rm -rf ~/.cache/nix && rm -rf /tmp/nix-build-* && rm -rf ~/.local/share/Trash/*";
CLEAR = "clear";
CLS = "clear";
cls = "clear";

PKG = "nix search nixpkgs";
SRC = "fc-list | grep -i";
FONTLIST = "fc-match -s";
GETHASH = "nix store prefetch-file"; ## GETHASH <link>
PKGLIST = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";

## productivities
CAM = "~/.local/bin/opencam";
DMUSIC = "yt-dlp --trim-filenames 80 --restrict-filenames -x --audio-format mp3 -S 'abr,codec' -o '~/Musics/%(playlist|NA)s/%(title)s [%(id)s].%(ext)s'";
DVIDEO = "yt-dlp --trim-filenames 80 --restrict-filenames -S 'res:720,codec,br,fps' -f 'bv*+ba/best' -o '~/Videos/%(playlist|NA)s/%(title)s [%(id)s].%(ext)s'";
IMGCOMPRESS="~/.local/bin/compress-images.sh";
DTAR = "~/.local/bin/tar.sh"; ## overwite folder to folder.tar.gz
XYZ = "~/.local/bin/xyz.sh";
MPG = "ffmpeg -i"; ## MPG <path/to/img.png> <overwrite/img/file>

## POWER
REBOOT = "sudo reboot";
OFF = "poweroff";

}
