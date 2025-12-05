vim.opt.number = true
vim.opt.cursorline = true
vim.opt.mouse = a
vim.opt.mousefocus = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 2

vim.opt.clipboard:append("unnamedplus")

vim.opt.colorcolumn = "80"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree focus")
  end,
})

