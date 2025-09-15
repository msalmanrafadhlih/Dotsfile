{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/tar.sh" = {
    text = ''
		#!/usr/bin/env bash
		# tar - simple tar.gz installer for cursor/icon themes

		# Tanya path file tar.gz
		read -p "Masukkan path ke file .tar.gz: " TARFILE

		# Cek apakah file ada
		if [ ! -f "$TARFILE" ]; then
		  echo "❌ File tidak ditemukan: $TARFILE"
		  exit 1
		fi

		# Tanya tujuan (default /etc/nixos/dots/config/icons/)
		read -p "Masukkan path tujuan [default: /home/$USER/]: " DEST
		DEST=${DEST:-}

		# Buat folder tujuan kalau belum ada
		mkdir -p "$DEST"

		# Ekstrak
		echo "📦 Mengekstrak $TARFILE ke $DEST ..."
		tar -xvzf "$TARFILE" -C "$DEST"

		echo "✅ Selesai! File sudah diekstrak ke: $DEST"
    '';
    executable = true;
  };
}
