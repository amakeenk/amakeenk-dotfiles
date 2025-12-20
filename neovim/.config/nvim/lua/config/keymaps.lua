vim.g.mapleader = " "

vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')

vim.keymap.set('n', '<leader><Left>', 'gT', { desc = 'Previous Tab' })
vim.keymap.set('n', '<leader><Right>', 'gt', { desc = 'Next Tab' })

vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste from system clipboard over visual selection' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show line diagnostics" })

