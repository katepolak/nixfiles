{ config, lib, pkgs, inputs, sys, ... }: {

	imports = [
		inputs.home-manager.nixosModules.home-manager
		../../secrets/sops.nix
	];

	nixpkgs.config.allowUnfree = true;

	# HACK: Used to fix a "bug" in sops-nix causing it to mkdir the ~/.ssh
	# directory with root as owner, this runs chown to manually fix it
	#
	# https://github.com/Mic92/sops-nix/issues/381
	systemd.services.fixSSHFolder = {
		script = ''
			chown ${config.users.users.${sys.user}.name} /home/${config.users.users.${sys.user}.name}/.ssh
			'';
		wantedBy = [ "multi-user.target" ];
		serviceConfig = {
			Type = "oneshot";
		};
	};

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
