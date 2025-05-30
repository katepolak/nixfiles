return {
	'echasnovski/mini.nvim',
	branch = 'main',
	config = function ()
		require('mini.align').setup({
			mappings = {
				start = '',
				start_with_preview = 'ga'
			}
		})
		require('mini.comment').setup()
		require('mini.cursorword').setup()
		require('mini.pairs').setup()
		require('mini.surround').setup({
			mappings = {
				add            = '<leader>sa', -- Add surrounding in Normal and Visual modes
				delete         = '<leader>sd', -- Delete surrounding
				find           = '<leader>sf', -- Find surrounding (to the right)
				find_left      = '<leader>sF', -- Find surrounding (to the left)
				highlight      = '<leader>sh', -- Highlight surrounding
				replace        = '<leader>sr', -- Replace surrounding
				update_n_lines = '<leader>sn', -- Update `n_lines`
			}
		})
		require('mini.indentscope').setup()
	end
}
