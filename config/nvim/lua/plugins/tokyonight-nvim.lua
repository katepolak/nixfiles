return {
	"folke/tokyonight.nvim",
	enabled = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("tokyonight-night")
		vim.cmd.highlight("Folded guibg=NONE guifg=darkorange")
	end
}
