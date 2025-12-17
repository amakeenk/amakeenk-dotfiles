vim.g.mapleader = " "

-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')

-- Tab navigation
vim.keymap.set('n', '<leader><Left>', 'gT', { desc = 'Previous Tab' })
vim.keymap.set('n', '<leader><Right>', 'gt', { desc = 'Next Tab' })

vim.keymap.set({'n','v'}, '<C-c>', '"+y')  -- копировать в системный буфер
vim.keymap.set({'n','v'}, '<C-v>', '"+p')  -- вставить из системного буфера

