return {
	{
		"numToStr/Comment.nvim",
		opts = {
			-- Включить подсветку текущего комментария
			toggler = {
				-- Установить поведение переключателя комментариев
				line = 'gcc', -- Переключатель строковых комментариев
				block = 'gbc', -- Переключатель блочных комментариев
			},
			opleader = {
				-- Операторы для создания комментариев
				line = 'gc',
				block = 'gb',
			},
			extra = {
				-- Дополнительные возможности
				above = 'gcO', -- Комментировать строку выше
				below = 'gco', -- Комментировать строку ниже
				eol = 'gcA', -- Комментировать до конца строки
			},
			mappings = {
				-- Отключить предустановленные маппинги если вы хотите управлять ими вручную
				basic = true,
				extra = true,
			},
			-- Настройки языков
			pre_hook = function(ctx)
				-- Здесь можно добавить специфичные для языка настройки
				if vim.bo.filetype == 'typescript' or vim.bo.filetype == 'javascript' then
					return require('ts_context_commentstring.integration').create_pre_hook()()
				end
			end,
		},
		dependencies = {
			'JoosepAlviste/nvim-ts-context-commentstring',
		},
	},
}