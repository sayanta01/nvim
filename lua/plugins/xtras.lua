return {
	-- {
	-- 	"LunarVim/bigfile.nvim",
	-- 	event = "BufReadPre",
	-- 	opts = {
	-- 		filesize = 1,
	-- 		pattern = { "*" },
	-- 		features = {
	-- 			-- "lsp",
	-- 			"treesitter",
	-- 			"filetype",
	-- 			-- "syntax",
	-- 		},
	-- 	},
	-- },

	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Up",   mode = { "n", "v" } },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Down", mode = { "n", "v" } },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"tsx",
			"jsx",
			"vue",
			"svelte",
			"xml",
			"php",
			"twig",
			"markdown",
			"astro",
		},
		config = function()
			require("nvim-ts-autotag").setup({
				skip_tags = "",
			})
		end,
	},

	{
		"b0o/SchemaStore.nvim",
		version = false,
		lazy = true,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		event = function()
			if vim.fn.exists("$TMUX") == 1 then
				return "VeryLazy"
			end
		end,
	},

	-- {
	-- 	"ThePrimeagen/vim-be-good",
	-- 	cmd = "VimBeGood",
	-- },

	-- {
	-- 	"szw/vim-maximizer",
	-- 	keys = {
	-- 		{ "<leader>ms", ":MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	-- 	},
	-- },
}
