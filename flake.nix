{
  description = "NixOs from Binary";
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
  outputs =
  { self, nixpkgs, nixpkgs-unstable, home-manager, nur, ... } @ inputs: let
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
#	devShells.${system} = {
#      suckless = import ./devshells/suckless.nix { inherit pkgs; };
#    };
  	
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		system = "x86_64-linux";
		modules = [
			home-manager.nixosModules.home-manager {
			  home-manager = {
				useGlobalPkgs = true;
				useUserPackages = true;
				users = {
					tquilla = import ./user/tquilla.nix;
#					whiskey = import ./user/whiskey.nix;
				};
				extraSpecialArgs = {
					inherit inputs;
				};
				backupFileExtension = "backup";
			  };
			}
			{ nixpkgs.overlays = [ overlay-unstable ]; }
			nur.modules.nixos.default
			
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
			
#			./module/firefox-preferences.nix
#			./module/power.nix
#			./module/acme.nix
#			./module/nginx.nix
		];
	};
  };  
}
