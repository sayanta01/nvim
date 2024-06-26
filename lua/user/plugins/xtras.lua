return {
	-- {
	-- 	"LunarVim/bigfile.nvim",
	-- 	event = "BufReadPre",
	-- 	opts = {
	-- 		filesize = 2,
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
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Up" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Down" },
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
		"ThePrimeagen/harpoon",
		lazy = true,
		config = true,
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
		version = false, -- last release is way too old
		lazy = true,
	},

	-- {
	-- 	"ThePrimeagen/vim-be-good",
	-- 	cmd = "VimBeGood",
	-- },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview" },
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
	-- 	"szw/vim-maximizer",
	-- 	keys = {
	-- 		{ "<leader>ms", ":MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	-- 	},
	-- },
}
