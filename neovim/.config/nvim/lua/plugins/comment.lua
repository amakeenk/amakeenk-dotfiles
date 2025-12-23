return {
	"numToStr/Comment.nvim",
	opts = {
		toggler = {
			line = "gcc",
			block = "gbc",
		},
		opleader = {
			line = "gc",
			block = "gb",
		},
		extra = {
			above = "gcO",
			below = "gco",
			eol = "gcA",
		},
		mappings = {
			basic = true,
			extra = true,
		},
		pre_hook = function(ctx)
			if vim.bo.filetype == "typescript" or vim.bo.filetype == "javascript" then
				return require("ts_context_commentstring.integration").create_pre_hook()()
			end
		end,
	},
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function(_, opts)
		require("Comment").setup(opts)
	end,
}

