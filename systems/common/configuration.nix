{ config, lib, pkgs, inputs, sys, ... }: {

	nixpkgs.config.allowUnfree = true;

	imports = [
		inputs.home-manager.nixosModules.home-manager
		../../secrets/sops.nix
	];

	home-manager = {
		extraSpecialArgs = {
			inherit sys;
			inherit inputs;
		};

		useGlobalPkgs = true;
		useUserPackages = true;

		users = {
			${sys.user} = ./home.nix;
		};
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
