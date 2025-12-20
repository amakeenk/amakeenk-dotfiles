vim.g.mapleader = " "

vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')

vim.keymap.set('n', '<leader><Left>', 'gT', { desc = 'Previous Tab' })
vim.keymap.set('n', '<leader><Right>', 'gt', { desc = 'Next Tab' })

-- Переключение между соседними буферами
vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', { desc = 'Next buffer' })

vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste from system clipboard over visual selection' })

-- Переключение между буферами по порядковому номеру отображения
vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', { desc = "Go to buffer 1 (display order)" })
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', { desc = "Go to buffer 2 (display order)" })
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', { desc = "Go to buffer 3 (display order)" })
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', { desc = "Go to buffer 4 (display order)" })
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', { desc = "Go to buffer 5 (display order)" })
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', { desc = "Go to buffer 6 (display order)" })
vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', { desc = "Go to buffer 7 (display order)" })
vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', { desc = "Go to buffer 8 (display order)" })
vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', { desc = "Go to buffer 9 (display order)" })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show line diagnostics" })

