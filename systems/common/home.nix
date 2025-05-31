{ config, lib, pkgs, sys, ...} : {
	imports = [
		./starfish.nix
	];

	home.username = sys.user;
	home.homeDirectory = "/home/${sys.user}";
	
	home.stateVersion = "24.11";

	home.shell.enableFishIntegration = true;

	home.file = {
		".config/nvim" = {
			source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/${sys.dotfilesDir}/config/nvim";
		};
	};

	home.packages = with pkgs; [

		jq
		age
		eza
		fd
		fzf
		grc
		sops
		ripgrep

		# Languageas
		gcc
		go
		nodejs
		zig
		typescript # also installs tsserver

		# LSPs
		gopls
		lua-language-server
		nixd
	];
	
	home.shellAliases = {
		cd       = "z";
		v        = "nvim .";
		find     = "fd";
		l        = "eza --long --all --git --header --group-directories-first --sort name";
		lt       = "eza --long --all --git --header --group-directories-first --tree --git-ignore --sort name --ignore-glob .git";

		# FIXME: This should probably only be added in WSL instances ...
		explorer = "/mnt/c/Windows/explorer.exe";
	};

	programs.fish = {
		enable = true;

		plugins = with pkgs.fishPlugins; [
			{ name = "done"        ; src = done.src;         }
			{ name = "forgit"      ; src = forgit.src;       }
			{ name = "fzf-fish"    ; src = fzf-fish.src;     }
			{ name = "grc"         ; src = grc.src;          }
		];

		shellAbbrs = {
			gs = "git status";
		};

		interactiveShellInit = "starship init fish | source";
	};

	programs.starship = {
		enable = true;
	};

	programs.bash = {
		enable = true;
		initExtra = "fish; exit";
	};

	programs.git = {
		enable = true;
		userName = "Katie P";
		userEmail = "personal@justkate.me";
	};

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	programs.zoxide = {
		enable = true;
		enableFishIntegration = true;
	};
}
