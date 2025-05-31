vim.g.mapleader      = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{ import = "plugins" }}, {
	dev = {}
})

-- Functional wrapper for mapping custom keybindings
function Map(mode, lhs, rhs, opts)
	local options = { noremap = true }

	if opts then
		options = vim.tbl_extend('force', options, opts)
	end

	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Navigation keybinds ----------------------------------------------------------------------------
Map('n', 'H',     '<Home>')
Map('n', 'J',     '<PageDown>')
Map('n', 'K',     '<PageUp>')
Map('n', 'L',     '<End>')
Map('n', '<C-h>', 'b')
Map('n', '<C-l>', 'w')

Map('v', 'H',     '<Home>')
Map('v', 'J',     '<PageDown>')
Map('v', 'K',     '<PageUp>')
Map('v', 'L',     '<End>')
Map('v', '<C-h>', 'b')
Map('v', '<C-l>', 'w')

-- Window navigation keybinds ---------------------------------------------------------------------
Map('n', '<leader>h', '<C-w>h')
Map('n', '<leader>j', '<C-w>j')
Map('n', '<leader>k', '<C-w>k')
Map('n', '<leader>l', '<C-w>l')

Map('n', '<leader>H', '<C-w>H')
Map('n', '<leader>J', '<C-w>J')
Map('n', '<leader>K', '<C-w>K')
Map('n', '<leader>L', '<C-w>L')

Map('n', '<leader>L', '<C-w>L')

Map('n', '<leader><Space>', '<cmd>q<CR>', { silent = true })
Map('n', '<leader>w',       '<cmd>w<CR>', { silent = true })

-- File tree keybinds -----------------------------------------------------------------------------
Map('n', '<leader>o', '<cmd>Neotree reveal<CR>', { silent = true })

-- Telescope keybinds -----------------------------------------------------------------------------
Map('n', '<leader>ff', '<cmd>Telescope find_files<CR>',    { silent = true })
Map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>',     { silent = true })
Map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>',     { silent = true })
Map('n', '<leader>ft', '<cmd>TodoTelescope<CR>',           { silent = true })
Map('n', 'z=',         '<cmd>Telescope spell_suggest<CR>', { silent = true })


-- LSP related keybinds ---------------------------------------------------------------------------
Map('n', 'gd',        '<cmd>Telescope lsp_definitions<CR>',       { silent = true })
Map('n', 'gr',        '<cmd>Telescope lsp_references<CR>',        { silent = true })
Map('n', 'gf',        '<cmd>Lspsaga lsp_finder<CR>',              { silent = true })
Map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>',   { silent = true })
Map('n', '<leader>d', '<cmd>lua vim.lsp.buf.hover()<CR>',         { silent = true })
Map('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>',                  { silent = true })

vim.o.spell = true

vim.o.hlsearch = false
vim.wo.number  = true
vim.o.mouse    = "a"
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase  = true

vim.wo.signcolumn = "yes"

vim.o.updatetime = 250
vim.o.timeout    = true
vim.o.timeoutlen = 300

vim.o.termguicolors = true

vim.opt.foldlevel = 99
