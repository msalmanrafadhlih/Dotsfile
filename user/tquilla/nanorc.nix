{ config, pkgs, lib, ... }:

{
  home.file.".nanorc" = {
    text = ''
	include "/nix/store/pxas1nkacyy018rr2n1fc3pszrbyb5lp-nano-8.4/share/nano/*.nanorc"
	include "/nix/store/pxas1nkacyy018rr2n1fc3pszrbyb5lp-nano-8.4/share/nano/extra/*.nanorc"

	set linenumbers
	set tabsize 	4
	set tabstospaces
	set autoindent

	set softwrap
#	set mouse
	set smooth

	set constantshow
	set indicator
    '';
    executable = true;
  };
}
