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
			NIX = "nano ~/.repos/nixos/host/configuration.nix";
			HNIX = "bat ~/.repos/nixos/host/hardware-configuration.nix";
			FLAKE = "nano ~/.repos/nixos/flake.nix";
			LOCK = "bat ~/.repos/nixos/flake.lock";

			FONTS = "nano ~/.repos/nixos/host/fonts.nix";
			SYSINSTALL = "nano  ~/.repos/nixos/host/system-packages.nix";
			SERVICE = "nano  ~/.repos/nixos/host/services.nix";
			PROGRAMS = "nano  ~/.repos/nixos/host/programs.nix";

			## GIT INTEGRATION
			GIT = "git add . && git commit -m";
			CLASS = "xprop | grep CLASS";
			NAME = "xprop | grep NAME";
			GRAPH = "git log --oneline --decorate --graph --all";

			##  USER CONFIGURATIONS {EDIT}
			TQU = "ls -la ~/.repos/nixos/home/tquilla && cd ~/.repos/nixos/home/tquilla";
			HOME = "nano ~/.repos/nixos/home/tquilla/home.nix";
			BASH = "source ~/.bashrc && nano ~/.repos/nixos/home/tquilla/bash.nix";
			INSTALL = "nano ~/.repos/nixos/home/tquilla/packages.nix";
			BAT = "nano ~/.repos/nixos/home/tquilla/bat.nix";
			XSESSION = "nano ~/.repos/nixos/home/tquilla/xsession.nix";
			PAD = "nano ~/.repos/nixos/home/tquilla/toggle_touchpad.nix";
			VOL = "nano ~/.repos/nixos/home/tquilla/volume.nix";
			BRIGHT = "nano ~/.repos/nixos/home/tquilla/brightness.nix";
			BAT0 = "nano ~/.repos/nixos/home/tquilla/battery.nix";
			NANO = "nano ~/.repos/nixos/home/tquilla/nanorc.nix";
			MPD = "nano ~/.repos/nixos/home/tquilla/mpd.nix";
			BRANCH = "nano ~/.repos/nixos/home/tquilla/git-prompt.nix";
			TAR = "nano ~/.repos/nixos/home/tquilla/tar.nix";
			BG = "nano ~/.repos/nixos/home/tquilla/background.nix";
			OPENCAM = "nano ~/.repos/nixos/home/tquilla/opencam.nix";
			BOOKMARK = "nano ~/.repos/nixos/home/tquilla/bookmarks.nix";
			REPOS = "nano ~/.repos/nixos/home/tquilla/github-repos.nix";
			TMUXSESSION = "nano ~/.repos/nixos/home/tquilla/tmux-sessions.nix";			
			
			##  USER CONFIGURATIONS {SAVE}
			BASHSAVE = "sudo chmod +x .bashrc";
			UTILS = "chmod +x ~/.local/bin/*.sh";
			

			##  DOTSFILE CONNFIGURATION & BSPWM
			CONFIG = "tree ~/.repos/nixos/dots/config && cd ~/.repos/nixos/dots/config";
			POLYMODULE = "tree ~/.repos/nixos/dots/config/polybar && cd ~/.repos/nixos/dots/config/polybar/modules";			
			POLYSCRIPT =  "cd ~/.repos/nixos/dots/config/polybar/script && tree";

			TMUX = "nano ~/.repos/nixos/dots/config/tmux/tmux.conf";
			ER = "nano ~/.repos/nixos/dots/config/bspwm/src/ExternalRules";
			BSPWM = "nano ~/.repos/nixos/dots/config/bspwm/bspwmrc";
			SXHKD = "nano ~/.repos/nixos/dots/config/sxhkd/sxhkdrc";
			POLY = "nano ~/.repos/nixos/dots/config/polybar/config.ini";
			ALAC = "nano ~/.repos/nixos/dots/config/alacritty/alacritty.toml";
			DUNST = "nano ~/.repos/nixos/dots/config/dunst/dunstrc";
			CURSOR = "nano ~/.icons/default/index.theme";
			PCOM = "nano ~/.repos/nixos/dots/config/picom/picom.conf";
			ANIMA = "nano ~/.repos/nixos/dots/config/picom/picom-animations.conf";
			POWERMENU = "nano /home/tquilla/.repos/nixos/dots/config/rofi/files/powermenu/type-4/style-1.rasi";
			ROFI = "nano /home/tquilla/.repos/nixos/dots/config/rofi/files/launchers/type-7/style-4.rasi";
			
			## Suckless Stuff
			SUCKPULL = "mv config.h config.h.bak && git pull";
			NSHELL = "cd shell && nix-shell && cd ..";
			PATCH = "patch -p1 <";
			STCONF = "cd ~/.repos/nixos/dots/config/st  && nano config.h";
			DMENUCONF = "cd ~/.repos/nixos/dots/config/dmenu && nano config.h";
			SLOCKCONF = "cd ~/.repos/nixos/dots/config/slock && nano config.h";
			CONFSAVE = "mv config.h config.h.bak";
			CONFDEL = "cp config.h.bak config.h";
			MAKE = "make clean && make && make install PREFIX=$HOME/.local";

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
