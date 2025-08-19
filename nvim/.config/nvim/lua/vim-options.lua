vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set colorcolumn=90")
vim.g.mapleader = " "

vim.opt.swapfile = false

-- Navigate vim panes better
-- Normal mode mappings for pane navigation
vim.api.nvim_set_keymap('n', '<M-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-l>', '<C-w>l', {noremap = true, silent = true})

-- Insert mode mappings
vim.api.nvim_set_keymap('i', '<M-h>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-j>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-k>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-l>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})

-- Terminal mode mappings
vim.api.nvim_set_keymap('t', '<M-h>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<M-j>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<M-k>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<M-l>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})



-- Resize splits using Ctrl + Arrow Keys
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Up>', ':horizontal resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>', ':horizontal resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ':lua vim.diagnostic.open_float()<CR>')
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle Zen Mode" })

vim.keymap.set("n", "<leader>ch", ":ObsidianToggleCheckbox<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

