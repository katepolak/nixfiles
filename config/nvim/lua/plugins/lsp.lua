return {
	{
		"neovim/nvim-lspconfig",
		config = function()

			-- LSP settings.
			--  This function gets run when an LSP connects to a particular buffer.
			-- local on_attach = function(_, bufnr)
			-- 	local nmap = function(keys, func, desc)
			-- 		if desc then
			-- 			desc = "LSP: " .. desc
			-- 		end
			--
			-- 		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			-- 	end
			--
			-- 	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
			--
			-- 	-- Create a command `:Format` local to the LSP buffer
			-- 	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
			-- 		vim.lsp.buf.format()
			-- 	end, { desc = "Format current buffer with LSP" })
			-- end

			vim.lsp.enable("nixd")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("gopls")
			vim.lsp.enable('roslyn_ls')
			vim.lsp.enable('zls')
		end
	},
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- your configuration comes here; leave empty for default settings
		},
	},
	{
		"folke/lazydev.nvim",
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
