{ repos, libs, manager, ... }:

{
  home.file.".local/bin/repository.sh" = {
	text = ''
#!/bin/sh
set -eu

# Set your terminal:
terminal="st"

configs="''$(ls -1d "$HOME"/.repos/*/ 2>/dev/null | xargs -n1 basename)"
[ -n "$configs" ] || exit 0

# Kalau tanpa argumen, print daftar repos
if [ $# -eq 0 ]; then
    printf '%s\n' $configs
    exit 0
fi

chosen="$1"
[ -n "$chosen" ] || exit 0

dir="$HOME/.repos/$chosen"

# Nuke any existing st (optional, kalau emang mau clean start)
pkill -x $terminal 2>/dev/null || true
sleep 0.1

# Launch a clean terminal: attach if exists, else create
exec $terminal -c AlacrittyPinned -e tmux new-session -As "$chosen" -c "$dir" & disown
exit 0
	'';
	executable = true;
  };
}
