return {
	'akinsho/toggleterm.nvim',
	enabled = false,
	version = '*',
	config = function ()

		require('toggleterm').setup({
			size = function(term)
				if term.direction == 'horizontal' then
					return 20
				elseif term.direction == 'vertical' then
					return vim.o.columns * 0.2
				end
			end
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set('t', '<esc>', [[<C-\><C-n><C-w><C-w>]], opts)
			vim.keymap.set('t', '<C-c>', [[<C-\><C-n><C-w>q]],     opts)
		end

		vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

		vim.keymap.set('n', '<leader>tt', [[<cmd>:ToggleTerm 1 direction=vertical<CR>]])

		-- All the commands have a space in from of them to prevent them from clogging up the shell history file
		vim.keymap.set('n', '<leader>th', [[<cmd>:TermExec 2 cmd=" clear && make run" direction=vertical<CR>]])
		vim.keymap.set('n', '<leader>tj', [[<cmd>:TermExec 2 cmd=" clear && make test" direction=vertical<CR>]])
		vim.keymap.set('n', '<leader>tk', [[<cmd>:TermExec 2 cmd=" clear && make build" direction=vertical<CR>]])
	end
}
