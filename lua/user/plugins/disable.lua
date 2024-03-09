return {
	{
		"nvim-cmp",
		dependencies = {
			{
				"Exafunction/codeium.nvim",
				enabled = false,
				build = ":Codeium Auth",
				opts = {},
			},
		},
	},

	{
		"akinsho/flutter-tools.nvim",
		enabled = false,
		ft = "dart",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = true,
	},
}
