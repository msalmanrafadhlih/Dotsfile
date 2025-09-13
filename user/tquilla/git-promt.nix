{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/git-prompt.sh" = {
    text = ''
      #!${pkgs.bash}/bin/bash

      # source script git-prompt bawaan Git (lengkap dengan __git_ps1, dll)
      source ${pkgs.gitAndTools.gitFull}/share/git/contrib/completion/git-prompt.sh

      # Contoh: set PS1 dengan git branch info
      # hijau: user@host, kuning: dir, merah: git-branch
      export PS1='\[\e[92m\]\u@\h\[\e[0m\]:\[\e[93m\]\w\[\e[0m\]$(__git_ps1 " \[\e[91m\](%s)\[\e[0m\]")\$ '
    '';
    executable = true;
  };
}
