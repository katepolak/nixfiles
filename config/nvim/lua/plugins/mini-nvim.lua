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
		require('mini.git').setup()
		require('mini.indentscope').setup()
		MiniStatusline = require('mini.statusline')

		MiniStatusline.setup({
			content = {
				active = function()
					local mode          = MiniStatusline.section_mode({ trunc_width = 120 })
					local git           = MiniStatusline.section_git({ trunc_width = 40 })
					local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
					local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
					local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local location      = MiniStatusline.section_location({ trunc_width = 75 })
					local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

					local devInfo = MiniStatusline.combine_groups({
						{  strings = { git, diff, diagnostics, lsp } },
					})

					if #devInfo == 0 then
						devInfo = " "
					end

					return MiniStatusline.combine_groups({
						{ hl = 'TransBlueBg',  strings = { mode } },
						'%#TransPB#',
						{ hl = 'TransPinkBg',  strings = { devInfo } },
						'%#TransWP#',
						'%<', -- Mark general truncate point
						{ hl = 'TransWhiteBg', strings = { filename } },
						'%=', -- End left alignment
						'%#TransWP#',
						{ hl = 'TransPinkBg',  strings = { fileinfo } },
						'%#TransPB#',
						{ hl = 'TransBlueBg',  strings = { search, location } },
					})
				end
			}
		})
	end
}
