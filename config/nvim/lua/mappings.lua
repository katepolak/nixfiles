-- Navigation keybinds ----------------------------------------------------------------------------
vim.keymap.set('n', 'H',     '<Home>')
vim.keymap.set('n', 'J',     '<PageDown>')
vim.keymap.set('n', 'K',     '<PageUp>')
vim.keymap.set('n', 'L',     '<End>')
vim.keymap.set('n', '<C-h>', 'b')
vim.keymap.set('n', '<C-l>', 'w')

vim.keymap.set('v', 'H',     '<Home>')
vim.keymap.set('v', 'J',     '<PageDown>')
vim.keymap.set('v', 'K',     '<PageUp>')
vim.keymap.set('v', 'L',     '<End>')
vim.keymap.set('v', '<C-h>', 'b')
vim.keymap.set('v', '<C-l>', 'w')

-- Window navigation keybinds ---------------------------------------------------------------------
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

vim.keymap.set('n', '<leader>H', '<C-w>H')
vim.keymap.set('n', '<leader>J', '<C-w>J')
vim.keymap.set('n', '<leader>K', '<C-w>K')
vim.keymap.set('n', '<leader>L', '<C-w>L')

vim.keymap.set('n', '<leader>L', '<C-w>L')

vim.keymap.set('n', '<leader><Space>', '<cmd>q<CR>', { silent = true })
vim.keymap.set('n', '<leader>w',       '<cmd>w<CR>', { silent = true })

-- File tree keybinds -----------------------------------------------------------------------------
vim.keymap.set('n', '<leader>o', '<cmd>Neotree reveal<CR>', { silent = true })

-- Telescope keybinds -----------------------------------------------------------------------------
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>',    { silent = true })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>',     { silent = true })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>',     { silent = true })
---@diagnostic disable-next-line: undefined-field This picker is created by the todo_comments plugin, so it's not present in the type def inside Snacks
vim.keymap.set('n', '<leader>ft', function() Snacks.picker.todo_comments() end, { silent = true })
vim.keymap.set('n', 'z=',         Snacks.picker.spelling,             { silent = true })


-- LSP related keybinds ---------------------------------------------------------------------------
vim.keymap.set('n', 'gd',        Snacks.picker.lsp_definitions,     { silent = true })
vim.keymap.set('n', 'gr',        Snacks.picker.lsp_references,      { silent = true })
vim.keymap.set('n', 'gf',        '<cmd>Lspsaga lsp_finder<CR>',            { silent = true })
vim.keymap.set('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true })
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.lsp.buf.hover()<CR>',       { silent = true })
vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>',      { silent = true })
