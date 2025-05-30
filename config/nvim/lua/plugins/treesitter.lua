return {
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
}
