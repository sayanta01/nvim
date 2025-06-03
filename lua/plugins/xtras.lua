return {
	-- {
	-- 	"folke/flash.nvim",
	--    -- stylua: ignore
	--    keys = {
	--      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
	--      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
	--      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
	--      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	--      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
	--    },
	-- },

	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>",  function() return require("dial.map").inc_normal() end,         expr = true, desc = "Up",   mode = { "n" } },
      { "<C-x>",  function() return require("dial.map").dec_normal() end,         expr = true, desc = "Down", mode = { "n" } },
      { "g<C-a>", function() return require("dial.map").inc_visual("visual") end, expr = true, desc = "Up",   mode = { "v" } },
      { "g<C-x>", function() return require("dial.map").dec_visual("visual") end, expr = true, desc = "Down", mode = { "v" } },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.constant.new({ elements = { "let", "const" } }),
					augend.semver.alias.semver,
				},
			})
		end,
	},

	{
		"b0o/SchemaStore.nvim",
		lazy = true,
		version = false,
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
