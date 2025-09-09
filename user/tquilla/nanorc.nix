{ config, pkgs, lib, ... }:

{
  home.file.".nanorc" = {
    text = ''
	include "~/.config/nano/*.nanorc"
	include "~/.config/nano/extra/*.nanorc"

	set linenumbers
	set tabsize 	4
#	set tabstospaces
	set autoindent
    
	set softwrap
#	set mouse
#	set smooth
	    
	set constantshow
	set indicator

	# Format file dengan Prettier
    bind ^W execute "prettier --write %s" main
    '';
    executable = true;
  };
}
