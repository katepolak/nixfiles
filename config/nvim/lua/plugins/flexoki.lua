return {
	"kepano/flexoki-neovim",
	dev      = true,
	priority = 1000,
	config   = function ()
		vim.cmd.colorscheme("flexoki-dark")
		--vim.cmd.highlight("Folded guibg=NONE guifg=darkorange")
	end
}
