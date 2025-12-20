return {
  "akinsho/bufferline.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      numbers = "ordinal", -- Показывать номера буферов: 'none' | 'ordinal' | 'buffer_id' | 'both' | function
      close_command = "bdelete! %d", -- Команда для закрытия буфера
      right_mouse_command = "bdelete! %d", -- Команда при правом клике
      left_mouse_command = "buffer %d", -- Команда при левом клике
      middle_click_autoclose = true, -- Закрывать буфер средней кнопкой мыши
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left"
        }
      },
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15, -- Prefix used when a buffer is deduplicated
      truncate_names = true, -- Whether or not tab names should be truncated
      tab_size = 18,
      diagnostics = "nvim_lsp", -- Показывать диагностику в bufferline
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and "ﬀ" or "ﳁ"
        return " " .. icon .. count
      end,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- Whether or not custom sorted buffers should persist
      -- The divider icon shown between buffers
      separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' }
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = "id",
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
    },
    highlights = {
      -- Здесь могут быть настройки цветов по умолчанию
    }
  },
  config = function(_, opts)
    require('bufferline').setup(opts)

    -- BufferLine mappings
    vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
    vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', { desc = 'Next buffer' })

    -- BufferLine buffer navigation mappings
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
  end
}
