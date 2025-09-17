with import <nixpkgs> { };
mkShell {
  buildInputs = [
    gcc
    gnumake
    pkg-config
    xorg.libX11
    xorg.libXft
    xorg.libXrender
  ];
}
