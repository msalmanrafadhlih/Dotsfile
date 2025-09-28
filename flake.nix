{
  description = "NixOs from Binary";
  inputs = {
#    st-src.url = "path:./user/tquilla/config/st";
#    dmenu-src.url = "path:./user/tquilla/config/dmenu";
	nixpkgs.url = "nixpkgs/nixos-25.05";
	home-manager = {
		url = "github:nix-community/home-manager/release-25.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};
  };
  outputs = 
  { self, nixpkgs, home-manager, ... }: let
  	system = "x86_64-linux";
  	pkgs = import nixpkgs { inherit system; };
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
			./system/configuration.nix
			./module/fonts.nix
			./module/services.nix
			./module/programs.nix
			./module/system-packages.nix
			./module/ssh.nix
			./module/security.nix
			./module/user.nix
			
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
		];
	};
  };
  
}
