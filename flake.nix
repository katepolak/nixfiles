{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix = {
			url = "github:Mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }@inputs:
	let
		wslSystem = {
			host = "nixos";
			user = "katie";
			system = "x86_64-linux";
		};
	in {
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {

				specialArgs = {
					sys = wslSystem;
					inherit inputs;
				};

				system = wslSystem.system;

				modules = [
					nixos-wsl.nixosModules.default
					home-manager.nixosModules.home-manager
					./systems/wsl/configuration.nix
					./systems/common/configuration.nix
				];
			};
		};
	};
}
