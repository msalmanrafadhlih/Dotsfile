with import <nixpkgs> { };
mkShell {
  buildInputs = [
    gcc
    gnumake
    pkg-config

    freetype
    imlib2

    xorg.libX11
    xorg.libXft
    xorg.libXrender
    xorg.libXcursor
    xorg.libXinerama
  ];
}
