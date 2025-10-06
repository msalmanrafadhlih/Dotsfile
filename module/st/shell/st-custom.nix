{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      pname = "st-custom";
      version = "0.8.5";

      src = ./.;

      nativeBuildInputs = [ pkgs.pkg-config ];
      buildInputs = [
        pkgs.xorg.libX11
        pkgs.xorg.libXft
        pkgs.xorg.libXrender
      ];
      
      patches = builtins.filter (p: pkgs.lib.hasSuffix ".diff" (toString p))
  		(builtins.attrValues (builtins.readDir ./patches));


      installPhase = ''
        mkdir -p $out/bin
        mkdir -p $out/share/man/man1
        make PREFIX=$out install
      '';
    })
  ];
}
