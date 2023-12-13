return {
	{ "nvim-lua/plenary.nvim", cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" } },

	{
		"ThePrimeagen/harpoon",
		lazy = true,
		config = true,
	},

	{ "tpope/vim-fugitive", cmd = { "G", "Git" } },

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		config = function()
			local path = require("mason-registry").get_package("debugpy"):get_install_path()
			require("dap-python").setup(path .. "/venv/bin/python")
		end,
	},

	{
		"linux-cultist/venv-selector.nvim",
		ft = "python",
		cmd = "VenvSelect",
		opts = {},
		keys = {
			{
				"<leader>vs",
				"<cmd>:VenvSelect<cr>",
			},
		},
	},

	{
		"leoluz/nvim-dap-go",
		ft = "go",
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
				},
			})
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			ensure_installed = {
				"python",
				"codelldb",
				"delve",
				"js",
				"javadbg",
			},
			automatic_installation = true,
		},
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

	-- "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
}
