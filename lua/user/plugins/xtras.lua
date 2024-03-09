return {
	{
		-- Library used by other plugins like `Telescope, Nonels`
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

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

	{ "tpope/vim-fugitive", cmd = { "G", "Git" } },

	{
		-- "saecki/crates.nvim",
		"sayanta01/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				src = {
					cmp = {
						enabled = true,
					},
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

	-- Dap
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		keys = {
			{
				"<leader>dPt",
				function()
					require("dap-python").test_method()
				end,
				desc = "Test Method",
				ft = "python",
			},
			{
				"<leader>dPc",
				function()
					require("dap-python").test_class()
				end,
				desc = "Test Class",
				ft = "python",
			},
		},
		config = function()
			local path = require("mason-registry").get_package("debugpy"):get_install_path()
			require("dap-python").setup(path .. "/venv/bin/python")
		end,
	},

	{
		"linux-cultist/venv-selector.nvim",
		ft = "python",
		opts = {
			name = {
				"venv",
				".venv",
				"env",
				".env",
			},
		},
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
		},
	},

	{
		"leoluz/nvim-dap-go",
		ft = "go",
		keys = {
			{
				"<leader>dPt",
				function()
					require("dap-go").debug_test()
				end,
				desc = "Debug Test",
				ft = "go",
			},
			{
				"<leader>dPl",
				function()
					require("dap-go").debug_last_test()
				end,
				desc = "Last Test",
				ft = "go",
			},
		},
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},
				delve = {
					path = "dlv",
					initialize_timeout_sec = 20,
					port = "${port}",
					-- additional args to pass to dlv
					args = {},
					-- the build flags that are passed to delve
					-- defaults to empty string, but can be used to provide flags
					-- such as "-tags=unit" to make sure the test suite is
					-- compiled during debugging, for example
					-- passing build flags using args is ineffective, as those are
					-- ignored by delve in dap mode
					build_flags = "",
				},
			})
		end,
	},

	{
		"b0o/SchemaStore.nvim",
		version = false, -- last release is way too old
		lazy = true,
	},

	-- Misc --
	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
	},

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
