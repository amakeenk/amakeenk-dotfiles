return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    require("neo-tree").setup {
      close_if_last_window = false,
      window = {
        width = 70,
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = false,
              use_image_nvim = true
            }
          },
        }
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      source_selector = {
        winbar = true,
        statusline = true,
      },
    }

    vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
    vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
  end
}
