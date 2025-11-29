vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set colorcolumn=90")
vim.g.mapleader = " "

vim.opt.swapfile = false


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

