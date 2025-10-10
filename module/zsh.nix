{ progra ms, libs, pkgs, ... }:

{
	programs.zsh = {
	  enable = true;
	  enableCompletions = true;
	  autosuggestions.enable = true;
	  syntaxHighlighting.enable = true;
	  history.size = 10000;
	  
	## ADD PLUGINS FROM ohmyzsh
	  oh-my-zsh = { # "ohMyZsh" without Home Manager
	    enable = true;
	    plugins = [ "git" "thefuck" ];
#	    theme = "robbyrussell";
	  };
	  
	## ADD CUSTOM  PLUGINS
#	  plugins = [
#	    {
#	      # will source zsh-autosuggestions.plugin.zsh
#	      name = "zsh-autosuggestions";
#	      src = pkgs.fetchFromGitHub {
#	        owner = "zsh-users";
#	        repo = "zsh-autosuggestions";
#	        rev = "v0.4.0";
#	        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
#	      };
#	    }
#	    {
#	      name = "enhancd";
#	      file = "init.sh";
#	      src = pkgs.fetchFromGitHub {
#	        owner = "b4b4r07";
#	        repo = "enhancd";
#	        rev = "v2.2.1";
#	        sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
#	      };
#	    }
#	  ];
	  initExtra = ''
if [ -z "$TMUX" ]; then
    sessions=''$(tmux list-sessions 2>/dev/null | wc -l)

    if [ "$sessions" -eq 0 ]; then
        tmux new-session
    else
        tmux attach-session \; choose-session
    fi
fi
	  '';
	  shellAliases = import ./aliases.nix;
	};
}
