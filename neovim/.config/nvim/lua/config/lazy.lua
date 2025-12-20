local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            "rebelot/kanagawa.nvim",
            name = "kanagawa",
            priority = 1000
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = {
                'nvim-tree/nvim-web-devicons',
            }
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
                "3rd/image.nvim",
            }
        },
        "neovim/nvim-lspconfig",
        "j-hui/fidget.nvim",

        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                {
                    "saghen/blink.cmp",
                    opts = {
                        max_length = 20,
                        fuzzy = {
                            prebuilt_binaries = {
                                force_version = "v1.8.0",
                            },
                        },
                    },
                },
            },
        },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.6',
            dependencies = {
                'nvim-lua/plenary.nvim',
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    build = 'make'
                }
            }
        },
        'echasnovski/mini.icons',
        {
            "MeanderingProgrammer/render-markdown.nvim",
            config = function()
                require('render-markdown').setup({})
            end
        },
        require('plugins.comment'),
    },
    checker = { enabled = false },
})
