vim.g.mapleader = " "

vim.keymap.set("n", "<leader><Left>", "gT", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader><Right>", "gt", { desc = "Next Tab" })

vim.keymap.set("v", "p", '"_dP', { desc = "Paste from system clipboard over visual selection" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>fr", function() require("telescope.builtin").oldfiles() end, { desc = "Find recent files" })

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

vim.keymap.set("n", "Q", ":q!<CR>", { desc = "Quit current buffer without save" })
vim.keymap.set("n", "QA", ":qa!<CR>", { desc = "Quit all buffers without save and exit" })
vim.keymap.set("n", "W", ":w<CR>", { desc = "Save current buffer" })
vim.keymap.set("n", "WA", ":wa<CR>", { desc = "Save all buffers" })
vim.keymap.set("n", "WQA", ":wqa<CR>", { desc = "Save all buffers and exit" })

