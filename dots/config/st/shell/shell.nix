with import <nixpkgs> { };
mkShell {
  buildInputs = [
    gcc
    imlib2
    gnumake
    freetype
    pkg-config
    xorg.libX11
    xorg.libXft
    xorg.libXrender
    xorg.libXcursor
  ];
}
