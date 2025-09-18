with import <nixpkgs> { };
mkShell {
  buildInputs = [
    gcc
    gnumake
    freetype
    pkg-config
    xorg.libX11
    xorg.libXft
    xorg.libXrender
    xorg.libXcursor
  ];
}
