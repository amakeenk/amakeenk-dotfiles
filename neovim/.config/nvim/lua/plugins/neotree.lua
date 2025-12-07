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
