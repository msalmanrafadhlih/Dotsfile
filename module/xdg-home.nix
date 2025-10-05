{ config, pkgs, ... }:

{
    xdg = {
        mime.enable = true; # Enable XDG MIME type handling
        mimeApps = {
          enable = true; # Enable XDG MIME application associations
          defaultApplications = {
            "x-scheme-handler/http" = [ "vivaldi-stable.dekstop" ]; # Default browser for HTTP
            "x-scheme-handler/https" = [ "vivaldi-stable.dekstop" ]; # Default browser for HTTPS
#            "image/png" = [ "feh.desktop" ]; # Default image viewer for PNG
#            "application/pdf" = [ "pdfviewer.desktop" ]; # Default PDF viewer
            # Add more associations as needed
          };
        };
    };
}
