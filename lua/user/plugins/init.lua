return {
	{ "nvim-lua/plenary.nvim", cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },

	--[[ { ]]
	--[[ 	"kevinhwang91/nvim-ufo", -- configure this ]]
	--[[ 	config = function() ]]
	--[[ 		require("ufo").setup() ]]
	--[[ 	end, ]]
	--[[ 	event = { "VeryLazy", "LspAttach" }, ]]
	--[[ 	dependencies = { ]]
	--[[ 		"kevinhwang91/promise-async", ]]
	--[[ 	}, ]]
	--[[ }, ]]

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
			},
			automatic_installation = true,
			handlers = {},
		},
	},

	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		config = function()
			require("project_nvim").setup({
				-- detection_methods = { "lsp", "pattern" }, NOTE: lsp detection will get annoying with multiple langs in one project
				detection_methods = { "pattern" },
				-- patterns used to detect root dir, when **"pattern"** is in detection_methods
				patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
				show_hidden = false,
				-- when set to false, you will get a message when project.nvim changes your directory
			})
		end,
	},

	{
		"folke/which-key.nvim",
		config = function()
			require("user.which-key")
		end,
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 299
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

	"christoomey/vim-tmux-navigator", -- tmux & split window navigation

	--[[ "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion) ]]
}
