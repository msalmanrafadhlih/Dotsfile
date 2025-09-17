{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      pname = "st-custom";
      version = "0.8.5";

      # ambil source code st dari folder lokal
      src = ./../dots/config/st;

      nativeBuildInputs = [ pkgs.pkg-config ];
      buildInputs = [
        pkgs.xorg.libX11
        pkgs.xorg.libXft
        pkgs.xorg.libXrender
      ];

      # otomatis ambil semua patch *.diff di folder patches
      patches = map (name: ./../dots/config/st/patches/${name})
        (builtins.attrNames (builtins.readDir ./../dots/config/st/patches));

      installPhase = ''
        mkdir -p $out/bin
        mkdir -p $out/share/man/man1
        make PREFIX=$out install
      '';
    })
  ];
}
