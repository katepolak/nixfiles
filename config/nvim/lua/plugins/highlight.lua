return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects"
		},
		build = ':TSUpdate',
		config = function()
			require'nvim-treesitter.configs'.setup {
				highlight = {
					enable = true,
					disable = {},
				},
				indent = {
					enable = true,
					disable = {},
				},
				ensure_installed = {
					"tsx",
					"json",
					"yaml",
					"html",
					"scss",
					"c_sharp",
					"go",
					"lua",
					"markdown",
					"markdown_inline"
				}
			}

			vim.cmd("set foldmethod=expr")
			vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
		end
	},
	{
		'm-demare/hlargs.nvim',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
		config = function()
			require('hlargs').setup {
				color = 'darkorange'
			}
		end
	},
	{
		'folke/todo-comments.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('todo-comments').setup {}
		end
	},
	{
		"kepano/flexoki-neovim",
		dev      = true,
		priority = 1000,
		enabled = true,

		---@module "flexoki"
		---@type FlexokiOptions
		opts = {
			variant = "auto",
			auto_apply = true,
			highlight_groups = {
				["TransWhiteBg"] = { bg = "#EEEEEE", fg = "#100F0F" },
				["TransWhiteFg"] = { fg = "#EEEEEE" },

				["TransPinkBg"] = { bg = "#F5A9B8", fg = "#100F0F" },
				["TransPinkFg"] = { fg = "#F5A9B8" },

				["TransBlueBg"] = { bg = "#5BCEFA", fg = "#100F0F" },
				["TransBlueFg"] = { fg = "#5BCEFA" },

				["TransWP"] = { bg = "#EEEEEE", fg = "#F5A9B8" },
				["TransPB"] = { bg = "#F5A9B8", fg = "#5BCEFA" },
				["TransBP"] = { bg = "#5BCEFA", fg = "#F5A9B8" },
				["TransPW"] = { bg = "#F5A9B8", fg = "#EEEEEE" }
			}
		}
	},
	{
		"nuvic/flexoki-nvim",
		priority = 1000,
		enabled = false,
	},
	{
		"cpplain/flexoki.nvim",
		priority = 1000,
		enabled = false,
	}
}
