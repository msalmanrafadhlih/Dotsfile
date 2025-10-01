{
  description = "NixOs from Binary";
  inputs = {
	nixpkgs.url = "nixpkgs/nixos-25.05";
	nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
	home-manager = {
		url = "github:nix-community/home-manager/release-25.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};
  };
  outputs =
  { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: let
  	system = "x86_64-linux";
  	pkgs = import nixpkgs { inherit system; };
	overlay-unstable = final: prev: {
		unstable = import nixpkgs-unstable { 
			inherit system;
		   	config.allowUnfree = true;
		};
	};
  	in
  {
  	devShells.${system}.suckless = pkgs.mkShell {
  	  packages = with pkgs; [
  	  	pkg-config
  	  	xorg.libX11
  	  	xorg.libXft
  	  	xorg.libXinerama
  	  	fontconfig
  	  	freetype
  	  	harfbuzz
  	  	gcc
  	  	gnumake
  	  ];
  	};
  	
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [
			home-manager.nixosModules.home-manager {
			  home-manager = {
				useGlobalPkgs = true;
				useUserPackages = true;
				users = {
					tquilla = import ./user/tquilla.nix;
					whiskey = import ./user/whiskey.nix;
				};
				backupFileExtension = "backup";
			  };
			}
			{ nixpkgs.overlays = [ overlay-unstable ]; }
			./system/configuration.nix
			./module/fonts.nix
			./module/services.nix
			./module/system-packages.nix
			./module/ssh.nix
			./module/sudo.nix
			./module/user.nix
			./module/audio.nix
			./module/touchpad.nix
			./module/splash.nix
			./module/window_manager.nix
			./module/gtk.nix
			./module/thunar.nix
#			./module/acme.nix
#			./module/nginx.nix
		];
	};
  };  
}

