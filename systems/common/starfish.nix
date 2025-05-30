{ config, lib, pkgs, sys, ...}: {
	programs.starship.settings = {
		"$schema" = "https://starship.rs/config-schema.json";
		add_newline = true;
		command_timeout = 500;
		continuation_prompt = "[∙](bright-black) ";
		format = let format = lib.concatStrings [
			"[  ](               bg:trans_blue)"
			"$username"
			"[█ ](fg:trans_blue  bg:trans_pink)"
			"[@](fg:bg          bg:trans_pink)"
			"[█ ](fg:trans_pink  bg:trans_white)"
			"$hostname"
			"[█ ](fg:trans_white bg:trans_pink)"
			"$directory"
			"[█ ](fg:trans_pink bg:trans_blue)"
			"[█ ](fg:trans_blue bg:bg)"
			"$git_branch"
			"$git_commit"
			#"$git_state"
			"$git_metrics"
			"$git_status"
			"[](fg:bg bg:fg)"
			"$docker_context"
			"$package"
			"[ ](fg:fg bg:bg)"
			"$c"
			"$cmake"
			"$container"
			"$deno"
			"$dotnet"
			"$golang"
			"$helm"
			"$lua"
			"$nodejs"
			"$python"
			"$rust"
			"$zig"
			"$nix_shell"
			"$env_var"
			"$custom"
			"$sudo"
			"$cmd_duration"
			"$line_break"
			"[](fg:trans_blue bg:bg)"
			"$time"
			"$character"
		]; in "${format}";
		right_format = "";
		scan_timeout = 30;

		palette = "flexoki_trans";
		palettes = {
			flexoki_trans = {
				bg  = "#100F0F";
				fg  = "#CECDC3";
				red = "#D14D41";
				orange = "#DA702C";
				yellow = "#D0A215";
				green = "#879139";
				cyan = "#3AA99F";
				blue = "#4385BE";
				purple = "#8B7EC8";
				magenta = "#CE5D97";

				trans_blue  = "#5BCEFA";
				trans_pink  = "#F5A9B8";
				trans_white = "#EEEEEE";
			};
		};

		c = {
			format = "[$symbol($version(-$name) )]($style) ";
			version_format = "v$raw";
			style = "";
			symbol = " ";
			disabled = false;
			detect_extensions = [
				"c"
				"h"
			];
			detect_files = [];
			detect_folders = [];
			commands = [
				[
					"cc"
					"--version"
				]
				[
					"gcc"
					"--version"
				]
				[
					"clang"
					"--version"
				]
			];
		};
		character = {
			format = " $symbol ";
			vicmd_symbol = "[](fg:bg bg:yellow)[](fg:yellow bg:bg)";
			disabled = false;
			success_symbol = "[](fg:bg bg:green)[](fg:green bg:bg)";
			error_symbol = "[](fg:bg bg:red)[](fg:red bg:bg)";
		};
		cmake = {
			format = "[$symbol($version )]($style) ";
			version_format = "v$raw";
			symbol = "△ ";
			style = "bold blue";
			disabled = false;
			detect_extensions = [];
			detect_files = [
				"CMakeLists.txt"
				"CMakeCache.txt"
			];
			detect_folders = [];
		};
		cmd_duration = {
			min_time = 2000;
			format = "[⏱ $duration]($style)";
			style = "yellow bold";
			show_milliseconds = false;
			disabled = false;
			show_notifications = false;
			min_time_to_notify = 45000;
		};
		container = {
			format = "[$symbol [$name]]($style) ";
			symbol = "⬢";
			style = "red bold dimmed";
			disabled = false;
		};
		deno = {
			format = "[$symbol($version )]($style) ";
			version_format = "v$raw";
			symbol = "🦕 ";
			style = "green bold";
			disabled = false;
			detect_extensions = [];
			detect_files = [
				"deno.json"
				"deno.jsonc"
				"mod.ts"
				"deps.ts"
				"mod.js"
				"deps.js"
			];
			detect_folders = [];
		};
		directory = {
			disabled = false;
			fish_style_pwd_dir_length = 0;
			format = "[$path]($style)[$read_only]($read_only_style)";
			home_symbol = "~";
			read_only = " ";
			read_only_style = "red";
			repo_root_format = "[$before_root_path]($style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) ";
			style = "fg:bg bold bg:trans_pink";
			truncate_to_repo = true;
			truncation_length = 3;
			truncation_symbol = "…/";
			use_logical_path = true;
			use_os_path_sep = true;
		};
		directory.substitutions = {
			# Here is how you can shorten some long paths by text replacement;
			# similar to mapped_locations in Oh My Posh:;
			"Documents" = " ";
			"Downloads" = " ";
			"Music" = " ";
			"Pictures" = " ";
			# Keep in mind that the order matters. For example:;
			# "Important Documents" = "  ";
			# will not be replaced, because "Documents" was already substituted before.;
			# So either put "Important Documents" before "Documents" or use the substituted version:;
			# "Important  " = "  ";
			"Important " = " ";
		};
		docker_context = {
			format = "[$symbol$context]($style) ";
			style = "blue bold";
			symbol = " ";
			only_with_files = true;
			disabled = false;
			detect_extensions = [];
			detect_files = [
				"docker-compose.yml"
				"docker-compose.yaml"
				"Dockerfile"
			];
			detect_folders = [];
		};
		dotnet = {
			format = "[$symbol($version )(🎯 $tfm )]($style) ";
			version_format = "v$raw";
			symbol = "🥅 ";
			style = "blue bold";
			heuristic = true;
			disabled = false;
			detect_extensions = [
				"csproj"
				"fsproj"
				"xproj"
			];
			detect_files = [
				"global.json"
				"project.json"
				"Directory.Build.props"
				"Directory.Build.targets"
				"Packages.props"
			];
			detect_folders = [];
		};
		fill = {
			style = "bold black";
			symbol = ".";
			disabled = false;
		};
		git_branch = {
			format = "[$symbol$branch(:$remote_branch)]($style) ";
			symbol = " ";
			style = "bold purple";
			truncation_length = 9223372036854775807;
			truncation_symbol = "…";
			only_attached = false;
			always_show_remote = false;
			ignore_branches = [];
			disabled = false;
		};
		git_commit = {
			commit_hash_length = 7;
			format = "[($hash$tag)]($style) ";
			style = "green bold";
			only_detached = true;
			disabled = false;
			tag_symbol = " 🏷  ";
			tag_disabled = true;
		};
		git_metrics = {
			added_style = "bold green";
			deleted_style = "bold red";
			only_nonzero_diffs = true;
			format = "([+$added]($added_style) )([-$deleted]($deleted_style) ) ";
			disabled = false;
		};
		git_state = {
			am = "AM";
			am_or_rebase = "AM/REBASE";
			bisect = "BISECTING";
			cherry_pick = "🍒PICKING(bold red)";
			disabled = false;
			format = "([$state( $progress_current/$progress_total)]($style)) ";
			merge = "MERGING";
			rebase = "REBASING";
			revert = "REVERTING";
			style = "bold yellow";
		};
		git_status = {
			ahead = "🏎💨$count";
			behind = "😰$count";
			conflicted = "🏳";
			deleted = "🗑";
			disabled = true;
			diverged = "😵";
			format = "([\[$all_status$ahead_behind]\]($style) )";
			ignore_submodules = false;
			modified = "📝";
			renamed = "👅";
			staged = "[++($count)](green)";
			stashed = "📦";
			style = "red bold";
			untracked = "🤷";
			up_to_date = "✓";
		};
		golang = {
			format = "[$symbol($version )]($style) ";
			version_format = "v$raw";
			symbol = " ";
			style = "bold cyan";
			disabled = false;
			detect_extensions = ["go"];
			detect_files = [
				"go.mod"
				"go.sum"
				"glide.yaml"
				"Gopkg.yml"
				"Gopkg.lock"
				".go-version"
			];
			detect_folders = ["Godeps"];
		};
		helm = {
			format = "[$symbol($version )]($style) ";
			version_format = "v$raw";
			symbol = "⎈ ";
			style = "bold white";
			disabled = false;
			detect_extensions = [];
			detect_files = [
				"helmfile.yaml"
				"Chart.yaml"
			];
			detect_folders = [];
		};
		hostname = {
			disabled = false;
			format = "[$ssh_symbol](blue dimmed bold)[$hostname]($style)";
			ssh_only = false;
			style = "fg:bg dimmed bold bg:trans_white";
			trim_at = ".";
		};
		kubernetes = {
			disabled = false;
			format = "[$symbol$context( ($namespace))]($style) in ";
			style = "cyan bold bg:trans_blue";
			symbol = "⛵ ";
		};
		kubernetes.context_aliases = {};
		line_break = {
			disabled = false;
		};
		lua = {
			format = "[$symbol($version )]($style) ";
			version_format = "v$raw";
			symbol = "🌙 ";
			style = "bold blue";
			lua_binary = "lua";
			disabled = false;
			detect_extensions = ["lua"];
			detect_files = [".lua-version"];
			detect_folders = ["lua"];
		};
		nix_shell = {
			format     = "[$symbol$state( ($name))]($style) ";
			disabled   = false;
			impure_msg = "[impure](bold red)";
			pure_msg   = "[pure](bold green)";
			style      = "bold blue";
			symbol     = "󱄅";
			heuristic  = true;
		};
		nodejs = {
			format = "[$symbol($version )]($style) ";
			not_capable_style = "bold red";
			style = "bold green";
			symbol = " ";
			version_format = "v$raw";
			disabled = false;
			detect_extensions = [
				"js"
				"mjs"
				"cjs"
				"ts"
				"mts"
				"cts"
			];
			detect_files = [
				"package.json"
				".node-version"
				".nvmrc"
			];
			detect_folders = ["node_modules"];
		};
		package = {
			format = "[$symbol$version]($style) ";
			symbol = "📦 ";
			style = "208 bold";
			display_private = false;
			disabled = false;
			version_format = "v$raw";
		};
		python = {
			format = "[$symbol$pyenv_prefix($version )(($virtualenv) )]($style) ";
			python_binary = [
				"python"
				"python3"
				"python2"
			];
			pyenv_prefix = "pyenv ";
			pyenv_version_name = true;
			style = "yellow bold";
			symbol = "🐍 ";
			version_format = "v$raw";
			disabled = false;
			detect_extensions = ["py"];
			detect_files = [
				"requirements.txt"
				".python-version"
				"pyproject.toml"
				"Pipfile"
				"tox.ini"
				"setup.py"
				"__init__.py"
			];
			detect_folders = [];
		};
		rust = {
			format = "[$symbol($version )]($style) ";
			version_format = "v$raw";
			symbol = "🦀 ";
			style = "bold red";
			disabled = false;
			detect_extensions = ["rs"];
			detect_files = ["Cargo.toml"];
			detect_folders = [];
		};
		time = {
			format = "[$symbol $time]($style)";
			style = "bold yellow";
			use_12hr = false;
			disabled = false;
			utc_time_offset = "local";
			# time_format = "%R"; # Hour:Minute Format;
			time_format = "%T"; # Hour:Minute:Seconds Format;
			time_range = "-";
		};
		username = {
			format = "[$user]($style)";
			show_always = true;
			style_root = "fg:red bold bg:trans_blue";
			style_user = "fg:bg bold bg:trans_blue";
			disabled = false;
		};
		zig = {
			format = "[$symbol($version )]($style) ";
			version_format = "v$raw";
			symbol = "↯ ";
			style = "bold yellow";
			disabled = false;
			detect_extensions = ["zig"];
			detect_files = [];
			detect_folders = [];
		};
		custom = {
		};
	};
}
