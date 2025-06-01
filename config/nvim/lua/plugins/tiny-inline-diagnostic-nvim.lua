return {
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
}
