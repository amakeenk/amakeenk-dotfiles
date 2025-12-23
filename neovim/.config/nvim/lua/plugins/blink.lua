return {
	"saghen/blink.cmp",
	opts = {
		max_length = 20,
		fuzzy = {
			prebuilt_binaries = {
				force_version = "v1.8.0",
			},
		},
	},
	config = function(_, opts)
		require("blink.cmp").setup(opts)
	end,
}
