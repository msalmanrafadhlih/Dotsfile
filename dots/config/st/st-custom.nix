{ pkgs, ... }:

let
  stSrc = ./st;
  stPatches = builtins.path { path = ./st/patches; name = "st-patches"; };
in {
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      pname = "st-custom";
      version = "0.8.5";

      src = stSrc;

      nativeBuildInputs = [ pkgs.pkg-config ];
      buildInputs = [
        pkgs.xorg.libX11
        pkgs.xorg.libXft
        pkgs.xorg.libXrender
      ];

      patches = map (name: "${stPatches}/${name}")
        (builtins.attrNames (builtins.readDir stPatches));

      installPhase = ''
        mkdir -p $out/bin
        mkdir -p $out/share/man/man1
        make PREFIX=$out install
      '';
    })
  ];
}
