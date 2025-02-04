return {
	-- {
	-- 	"folke/snacks.nvim",
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	opts = {
	-- 		bigfile = { enabled = true },
	-- 	},
	-- },

	-- {
	-- 	"Exafunction/codeium.nvim",
	-- 	enabled = true,
	-- 	build = ":Codeium Auth",
	-- 	config = true,
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
		"b0o/SchemaStore.nvim",
		version = false,
		lazy = true,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			require("lazy").load({ plugins = { "markdown-preview.nvim" } })
			vim.fn["mkdp#util#install"]()
		end,
		keys = { { "<leader>oo", ft = "markdown", ":MarkdownPreviewToggle<CR>", desc = "Markdown Preview" } },
		config = function()
			vim.cmd([[do FileType]])
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
}
