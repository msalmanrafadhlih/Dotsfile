{ config, pkgs, nixpkgs-unstable, pkgs-stable, ... }:

{

  programs.bash = {
        enable = true;
        initExtra = ''

        	PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; 
        	PS1='\[\e[92m\]\u\[\e[0m\] \[\e[38;5;244;2;5m\]\s\[\e[0m\]in \[\e[93m\]\w\[\e[0m\] \$ ~ \[\e[91m\]''${PS1_CMD1}\n\[\e[0m\]'

			if [ -z "$TMUX" ]; then
			    sessions=$(tmux list-sessions 2>/dev/null | wc -l)

			    if [ "$sessions" -eq 0 ]; then
			        tmux new-session
			    else
			        tmux attach-session \; choose-session
			    fi
			fi
#
#			[ -z "$TMUX" ] && tmux attach || tmux new
#			[ -z "$TMUX" ] && tmux attach-session -t $(tmux ls -F '#S' 2>/dev/null | tail -n1) || tmux new-session

			export HISTSIZE=5000
		    export HISTFILESIZE=10000
		    export HISTCONTROL=ignoredups:erasedups
		    export PATH="$HOME/.local/bin:$PATH"
#		    export PROMPT_COMMAND='echo -ne "\e]7;file://''${PWD}\a"'
		    shopt -s histappend
			shopt -s autocd
	    	shopt -s cdspell
	    	shopt -s nocaseglob
	    	
	    	REMOTE() {
			    git remote set-url origin git@github.com:"$1"/"$2".git
			}
    	'';
        shellAliases = {
        
			test = "echo 'i use NixOS btw!!'";	 
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
			PROGRAMS = "nano  ~/.repos/nixos/module/programs.nix";

			## GIT INTEGRATION
			GIT = "git add . && git commit -m";
			CLASS = "xprop | grep CLASS";
			NAME = "xprop | grep NAME";
			GRAPH = "git log --oneline --decorate --graph --all";

			##  USER CONFIGURATIONS {EDIT}
			TQU = "cd ~/.repos/nixos/module && ls -la";
			HOME = "nano ~/.repos/nixos/user/tquilla/home.nix";
			BASH = "source ~/.bashrc && nano ~/.repos/nixos/module/bash.nix";
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
			
			##  USER CONFIGURATIONS {SAVE}
			BASHSAVE = "sudo chmod +x .bashrc";
			UTILS = "chmod +x ~/.local/bin/*.sh";
			

			##  DOTSFILE CONNFIGURATION & BSPWM
			CONFIG = "tree ~/.repos/nixos/user/tquilla/config && cd ~/.repos/nixos/user/tquilla/config";
			POLYMODULE = "tree ~/.repos/nixos/user/tquilla/config/polybar && cd ~/.repos/nixos/user/tquilla/config/polybar/modules";			
			POLYSCRIPT =  "cd ~/.repos/nixos/user/tquilla/config/polybar/script && tree";

			TMUX = "nano ~/.repos/nixos/user/tquilla/config/tmux/tmux.conf";
			ER = "nano ~/.repos/nixos/user/tquilla/config/bspwm/src/ExternalRules";
			BSPWM = "nano ~/.repos/nixos/user/tquilla/config/bspwm/bspwmrc";
			SXHKD = "nano ~/.repos/nixos/user/tquilla/config/sxhkd/sxhkdrc";
			POLY = "nano ~/.repos/nixos/user/tquilla/config/polybar/config.ini";
			ALAC = "nano ~/.repos/nixos/user/tquilla/config/alacritty/alacritty.toml";
			DUNST = "nano ~/.repos/nixos/user/tquilla/config/dunst/dunstrc";
			CURSOR = "nano ~/.icons/default/index.theme";
			PCOM = "nano ~/.repos/nixos/user/tquilla/config/picom/picom.conf";
			ANIMA = "nano ~/.repos/nixos/user/tquilla/config/picom/picom-animations.conf";
			POWERMENU = "nano ~/.repos/nixos/user/tquilla/config/rofi/files/powermenu/type-4/style-1.rasi";
			ROFI = "nano ~/.repos/nixos/user/tquilla/config/rofi/files/launchers/type-7/style-4.rasi";
			
			## Suckless Stuff
			SUCKPULL = "mv config.h config.h.bak && git pull";
			NSHELL = "cd shell && nix-shell && cd ..";
			PATCH = "patch -p1 <";
			STCONF = "cd ~/.repos/nixos/user/tquilla/config/st  && nano config.h";
			DMENUCONF = "cd ~/.repos/nixos/user/tquilla/config/dmenu && nano config.h";
			SLOCKCONF = "cd ~/.repos/nixos/user/tquilla/config/slock && nano config.h";
			CONFSAVE = "mv config.h config.h.bak";
			CONFDEL = "cp config.h.bak config.h";
			MAKE = "make clean && make && make install PREFIX=$HOME/.local";
			SUCKLESS = "nano ~/.repos/nixos/module/sucless.nix";

			## Tmux
			TMUXSAVE = "tmux source-file ~/.config/tmux/tmux.conf";
			TMUXDEL = "tmux kill-server";
						  
			##  OTHER
			SAVE = "source ~/.bashrc && dunstify 'bash saved'";
			SAVEFLAKE = "sudo nixos-rebuild switch --flake ~/.repos/nixos#nixos";

			OLD = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
			GBGOLD = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +3";
			GBG = "nix-collect-garbage";
			OPTIMISE = "nix-store --optimise";
			GC = "nix-store --gc";
			CLEANER = "rm -rf ~/.cache/nix && rm -rf /tmp/nix-build-* && rm -rf ~/.local/share/Trash/*";
			CLEAR = "clear";

			PKG = "nix search nixpkgs";
			SRC = "fc-list | grep -i";
			FONTLIST = "fc-match -s";
			PKGLIST = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";

			## productivities
			CAM = "~/.local/bin/opencam";
			DMUSIC = "yt-dlp --trim-filenames 80 --restrict-filenames -x --audio-format mp3 -S 'abr,codec' -o '~/.local/share/mpd/Musics/%(playlist|NA)s/%(title)s [%(id)s].%(ext)s'";
			DVIDEO = "yt-dlp --trim-filenames 80 --restrict-filenames -S 'res:720,codec,br,fps' -f 'bv*+ba/best' -o '~/Videos/%(playlist|NA)s/%(title)s [%(id)s].%(ext)s'";
			DTAR = "~/.local/bin/tar.sh";
			XYZ = "~/.local/bin/xyz.sh";
			MPG = "ffmpeg -i";
			
			## POWER
			REBOOT = "sudo reboot";
			OFF = "poweroff";	  
        };
  };
}
