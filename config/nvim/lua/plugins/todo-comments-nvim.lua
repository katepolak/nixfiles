return {
	'folke/todo-comments.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		require('todo-comments').setup {
			highlight = {
				-- Makes is so so all todo comments continue onto
				-- the next line, only stopped by empty lines, like this:
				--
				-- INFO: this is an example
				-- this is a second line of the example
				--
				-- this line isn't part of it anymore
				multiline_pattern = '^.'
			}
		}
	end
}
