{
  description = "Optimized NixOS flake from Binary";

  ###########################
  ##  🔧 Flake Configuration
  ###########################
  nixConfig = {
    auto-optimise-store = true;
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://cache.nixos.community"
      "https://nixpkgs-wayland.cachix.org"
      "https://spicetify-nix.cachix.org"
    ];

    trusted-public-keys = [
	  "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
	  "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
	  "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
	  "spicetify-nix.cachix.org-1:jjnwULkvMdu0E5KGBbtgrISEfDdJTGSZ4ATkiFzZn5I="
    ];
  };

  ###########################
  ##  📦 Flake Inputs
  ###########################
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    textfox.url = "github:adriankarlen/textfox";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  ###########################
  ##  ⚙️ Flake Outputs
  ###########################
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nur, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };

    overlay-unstable = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ###################################
        ## 🏠 Home Manager Integration
        ###################################
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users = {
              tquilla = import ./user/tquilla.nix;
              # whiskey = import ./user/whiskey.nix;
            };
            extraSpecialArgs = { inherit inputs; };
            backupFileExtension = "backup";
          };
        }

        ###################################
        ## 🧩 Overlays & External Modules
        ###################################
        { nixpkgs.overlays = [ overlay-unstable ]; }
        nur.modules.nixos.default

        ###################################
        ## 🧱 Local Modules
        ###################################
        ./system/configuration.nix
        ./module/fonts.nix
        ./module/services.nix
        ./module/system-packages.nix
        ./module/hardware-acceleration.nix
        ./module/ssh.nix
        ./module/zsh.nix
        ./module/sudo.nix
        ./module/user.nix
        ./module/audio.nix
        ./module/touchpad.nix
        ./module/splash.nix
        ./module/window-manager.nix
        ./module/gtk.nix
        ./module/thunar.nix
        # ./module/firefox-preferences.nix
        # ./module/power.nix
        # ./module/acme.nix
        # ./module/nginx.nix

        ###################################
        ## ⚡ Nix Daemon & Build Optimization
        ###################################
        {
          nix.settings = {
			extra-experimental-features = [ "nix-command" "flakes" ];
            # pastikan sama seperti di nixConfig
            extra-substituters = [
              "https://cache.nixos.org"
              "https://nix-community.cachix.org"
              "https://cache.nixos.community"
#              "https://nixpkgs-wayland.cachix.org"
              "https://spicetify-nix.cachix.org"
            ];

            extra-trusted-public-keys = [
              "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
              "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
 #             "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
              "spicetify-nix.cachix.org-1:jjnwULkvMdu0E5KGBbtgrISEfDdJTGSZ4ATkiFzZn5I="
            ];

            auto-optimise-store = true;
            keep-derivations = true;
            keep-outputs = true;
            warn-dirty = false;
          };

          # optimize nix-daemon resource usage
          systemd.services.nix-daemon.serviceConfig = {
            CPUQuota = "80%";
            IOSchedulingClass = "best-effort";
            IOSchedulingPriority = 4;
          };
        }
      ];
    };
  };
}
