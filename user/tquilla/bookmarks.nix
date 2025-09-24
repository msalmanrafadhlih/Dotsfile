{ libs, pkgs, service, ... }:

{
  home.file.".local/bin/bookmarks.sh" = {
    text = ''
#!/bin/sh
set -eu

# Files
PERS_FILE="''${PERS_FILE:-$HOME/.config/bookmarks/personal.txt}"
WORK_FILE="''${WORK_FILE:-$HOME/.config/bookmarks/work.txt}"

# Browser: hanya Brave
BRAVE="''$(command -v brave || command -v brave-browser || true)"
FALLBACK="''$(command -v xdg-open || echo brave)"

# Ensure files exist
mkdir -p "''$(dirname "$PERS_FILE")"

if [ ! -f "$PERS_FILE" ]; then
cat >"$PERS_FILE" <<EOF
# personal
tonybtw :: https://tonybtw.com
https://youtube.com
EOF
fi

if [ ! -f "$WORK_FILE" ]; then
cat >"$WORK_FILE" <<EOF
# work
[docs] NixOS Manual :: https://nixos.org/manual/
EOF
fi

emit() {
    tag="$1"; file="$2"
    [ -f "$file" ] || return 0
    grep -vE '^\s*(#|$)' "$file" | while IFS= read -r line; do
        case "$line" in
            *"::"*)
                lhs="''${line%%::*}"; rhs="''${line#*::}"
                lhs="''$(printf '%s' "$lhs" | sed 's/[[:space:]]*$//')"
                rhs="''$(printf '%s' "$rhs" | sed 's/^[[:space:]]*//')"
                printf '[%s] %s :: %s\n' "$tag" "$lhs" "$rhs"
                ;;
            *)
                printf '[%s] %s :: %s\n' "$tag" "$line" "$line"
                ;;
        esac
    done
}

# Kalau tidak ada argumen: keluarkan list ke Rofi
if [ $# -eq 0 ]; then
    {
        emit personal "$PERS_FILE"
        emit work     "$WORK_FILE"
    } | sort
    exit 0
fi

# Kalau ada argumen: itu adalah pilihan dari user
choice="$1"

# Parse raw URL
raw="''${choice##* :: }"
raw="''$(printf '%s' "$raw" \
| sed -e 's/[[:space:]]\+#.*$//' -e 's/[[:space:]]\/\/.*$//' \
      -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

case "$raw" in
    http://*|https://*|file://*|about:*|chrome:*) url="$raw" ;;
    *) url="https://$raw" ;;
esac

# Always use Brave if available
if [ -n "$BRAVE" ]; then
    nohup "$BRAVE" --new-tab "$url" >/dev/null 2>&1 &
    exit 0
fi

# Fallback
nohup $FALLBACK "$url" >/dev/null 2>&1 &

    '';
    executable = true;
  };
}
