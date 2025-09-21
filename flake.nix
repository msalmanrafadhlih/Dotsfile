
{
  description = "NixOs from Binary";
  inputs = {
	nixpkgs.url = "nixpkgs/nixos-25.05";
	home-manager = {
		url = "github:nix-community/home-manager/release-25.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};
  };
  outputs = 
  { self, nixpkgs, home-manager, ... }: 
  
  {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [
			./hosts/configuration.nix
			# ./hosts/addModulesHere...
			home-manager.nixosModules.home-manager {
			  home-manager = {
				useGlobalPkgs = true;
				useUserPackages = true;
				users.tquilla = import ./user/tquilla/home.nix;
				backupFileExtension = "backup";
			  };
			}
		];
	};
  };
  
}
