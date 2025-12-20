return {
  "mikavilpas/yazi.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- Путь к бинарному файлу yazi (если он не в PATH)
    -- yazi_path = "/usr/bin/yazi", -- раскомментируйте и измените путь при необходимости

    -- Кастомизация внешнего вида
    floating_window_scaling_factor = 0.9, -- масштаб плавающего окна (0.0 - 1.0)
    floating_window_border = "rounded", -- стиль границы окна: "single", "double", "rounded", "solid", "shadow"

    -- Персонализированные настройки для yazi
    yazi_floating_window_winblend = 0, -- прозрачность фона окна (0-100)
    
    -- Маппинги внутри yazi (опционально)
    keymaps = {
      -- По умолчанию плагин использует 'gz' для запуска yazi
      -- yazi = {
      --   "gz", -- основная команда для запуска yazi
      --   desc = "Open yazi",
      -- },

      -- Окно превью файла в yazi
      -- toggle_preview = { "space", desc = "Toggle preview in yazi" },

      -- Заменить текущий буфер выбранным файлом
      -- use_yazi_to_replace_current_buffer = { 
      --   "<C-o>", 
      --   desc = "Use yazi to replace current buffer" 
      -- },
    },

    -- Автоматическое открытие файла после выбора в yazi
    open_file_in_prev_win = true, -- открывать файл в предыдущем окне вместо сплитования

    -- Дополнительные параметры командной строки для yazi
    additional_yazi_args = {},
  },
  keys = {
    { 
      "gz", 
      "<cmd>Yazi<CR>", 
      desc = "Open yazi file manager" 
    },
  },
}