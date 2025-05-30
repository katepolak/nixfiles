{ config, lib, pkgs, inputs, sys, ...}: {
	imports = [
		inputs.sops-nix.nixosModules.sops
	];

	sops = {
		defaultSopsFile = ./secrets.yaml;
		defaultSopsFormat = "yaml";
		age.keyFile = "/home/${sys.user}/.config/sops/age/keys.txt";
		secrets = {
			"primarySSH/primarySSH" = {
				owner = config.users.users.${sys.user}.name;
				group = config.users.users.${sys.user}.group;
				path  = "/home/${sys.user}/.ssh/id_rsa";
				mode  = "0600";
			};
			"primarySSH/primarySSH.pub" = {
				owner = config.users.users.${sys.user}.name;
				group = config.users.users.${sys.user}.group;
				path  = "/home/${sys.user}/.ssh/id_rsa.pub";
				mode  = "0644";
			};
		};
	};
}
