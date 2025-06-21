return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

			vim.fn.sign_define('DiagnosticSignError',
				{text = '󰅙 ', texthl = 'DiagnosticSignError'})
			vim.fn.sign_define('DiagnosticSignWarn',
				{text = ' ', texthl = 'DiagnosticSignWarn'})
			vim.fn.sign_define('DiagnosticSignInfo',
				{text = ' ', texthl = 'DiagnosticSignInfo'})
			vim.fn.sign_define('DiagnosticSignHint',
				{text = ' ', texthl = 'DiagnosticSignHint'})

			require('neo-tree').setup({
				sources = {
					"filesystem",
				},
				source_selector = {
					truncation_character = ' ',
					winbar = false,
				},
				close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
				popup_border_style = 'rounded',
				enable_git_status = true,
				enable_diagnostics = true,
				default_component_configs = {
					indent = {
						indent_size = 2,
						padding = 1, -- extra padding on left hand side
						-- indent guides
						with_markers = true,
						indent_marker = '│',
						last_indent_marker = '└',
						highlight = 'NeoTreeIndentMarker',
						-- expander config, needed for nesting files
						with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
						expander_collapsed = '',
						expander_expanded = '',
						expander_highlight = 'NeoTreeExpander',
					},
					icon = {
						folder_closed = '',
						folder_open = '',
						folder_empty = '',
						folder_empty_open = '',
						default = '',

					},
					modified = {
						symbol = '[+]',
						highlight = 'NeoTreeModified',
					},
					name = {
						trailing_slash = false,
						use_git_status_colors = true,
					},
					git_status = {
						symbols = {
							-- Change type
							added     = ' ', -- or '✚', but this is redundant info if you use git_status_colors on the name
							modified  = '', -- or '', but this is redundant info if you use git_status_colors on the name
							deleted   = ' ',-- this can only be used in the git_status source
							renamed   = ' ',-- this can only be used in the git_status source
							-- Status type
							untracked = ' ',
							ignored   = ' ',
							unstaged  = '󰄱 ',
							staged    = ' ',
							conflict  = ' ',
						}
					},
				},
				window = {
					position = 'left',
					width = 40,
					mappings = {
						['<2-LeftMouse>'] = 'open',
						['<cr>'] = 'open',
						['S'] = 'open_split',
						['s'] = 'open_vsplit',
						['t'] = 'open_tabnew',
						['C'] = 'close_node',
						['a'] = 'add',
						['A'] = 'add_directory',
						['d'] = 'delete',
						['r'] = 'rename',
						['y'] = 'copy_to_clipboard',
						['x'] = 'cut_to_clipboard',
						['p'] = 'paste_from_clipboard',
						['c'] = 'copy', -- takes text input for destination
						['m'] = 'move', -- takes text input for destination
						['q'] = 'close_window',
						['R'] = 'refresh',
					}
				},
				nesting_rules = {},
				filesystem = {
					filtered_items = {
						visible = false, -- when true, they will just be displayed differently than normal items
						hide_dotfiles = false,
						hide_gitignored = true,
						hide_by_name = {
							'.DS_Store',
							'thumbs.db',
							'node_modules',
							'zig-cache',
							'zig-out'
						},
						never_show = {
							'.DS_Store',
							'thumbs.db'
						},
					},
					hijack_netrw_behavior = 'open_current',
					use_libuv_file_watcher = true,
					window = {
						mappings = {
							['<bs>'] = 'navigate_up',
							['.'] = 'set_root',
							['H'] = 'toggle_hidden',
							['/'] = 'fuzzy_finder',
							['f'] = 'filter_on_submit',
							['<c-x>'] = 'clear_filter',
						}
					}
				},
				buffers = {
					show_unloaded = true,
					window = {
						mappings = {
							['bd'] = 'buffer_delete',
							['<bs>'] = 'navigate_up',
							['.'] = 'set_root',
						}
					},
				},
				git_status = {
					window = {
						position = 'float',
						mappings = {
							['A']  = 'git_add_all',
							['gu'] = 'git_unstage_file',
							['ga'] = 'git_add_file',
							['gr'] = 'git_revert_file',
							['gc'] = 'git_commit',
							['gp'] = 'git_push',
							['gg'] = 'git_commit_and_push',
						}
					}
				},
				diagnostics = {}
			})
		end
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				search = {
					enabled = true
				}
			}
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		---@module 'gitsigns'
		---@type Gitsigns.Config
		opts = {
			signcolumn = false,
			numhl = true,
		}
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		config = function()
			require('tiny-inline-diagnostic').setup({
				preset = 'powerline',
				options = {
					multilines = {
						enabled = true,
						always_show = true
					}
				}
			})

			vim.diagnostic.config({
				virtual_text = false,
			})
		end
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				override_vim_notify = true
			}
		}
	},
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			picker = {
				-- your picker configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		}
	},
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		opts = {

		},
		init = function ()
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99

			vim.opt.foldmethod = "expr"
			-- vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
		end
	}
}
