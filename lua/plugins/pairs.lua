return {
	{
		"nvim-mini/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true },
		},
	},

	{
		"nvim-mini/mini.surround",
		keys = { "sa", "sd", "sr" },
		opts = {
			mappings = {
				add = "sa",
				delete = "sd",
				replace = "sr",
				find = "sf",
				findleft = "sF",
				highlight = "sh",
			},
		},
	},

	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	config = true,
	-- 	ft = {
	-- 		"html",
	-- 		"javascript",
	-- 		"typescript",
	-- 		"javascriptreact",
	-- 		"typescriptreact",
	-- 		"jsx",
	-- 		"tsx",
	-- 		"markdown",
	-- 		"php",
	-- 		"twig",
	-- 		"vue",
	-- 		"xml",
	-- 		"svelte",
	-- 		"astro",
	-- 	},
	-- },
}
