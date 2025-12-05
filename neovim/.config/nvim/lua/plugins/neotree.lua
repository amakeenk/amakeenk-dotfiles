require("neo-tree").setup {
    close_if_last_window = false,
    window = {
        width = 70,
        mappings = {
            ["<cr>"] = function(state)
                local node = state.tree:get_node()
                if node then
                    if node.type == 'file' then
                        vim.api.nvim_command('tabedit ' .. node.path)
                    else
                        -- For directories, call the 'open' command from the state
                        state.commands.open(state)
                    end
                end
            end,
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
