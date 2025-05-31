return {
	"glepnir/lspsaga.nvim",
	enabled = false,
	dependencies = {
		{"nvim-tree/nvim-web-devicons"},
		{"nvim-treesitter/nvim-treesitter"}
	},
	config = function ()
		require("lspsaga").setup({
			lightbulb = {
				virtual_text = false,
			},
			ui = {
				border = 'rounded'
			},
			symbol_in_winbar = {
				enable = false
			}
		})
	end
}
