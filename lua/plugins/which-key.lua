return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeoutlen = 200
	end,
	opts = {
		preset = "modern",
		filter = function(mapping)
			return mapping.desc and mapping.desc ~= ""
		end,
		triggers = {
			{ "<leader>", mode = { "n", "v" } },
		},
		win = {
			no_overlap = false,
			title = false,
		},
		icons = {
			breadcrumb = "»",
			separator = "•",
			group = "",
			mappings = false,
			keys = {
				Up = "↑",
				Down = "↓",
				Left = "«",
				Right = "»",
				C = "⌃",
				M = "M",
				CR = "↩︎",
				NL = "↩︎",
				BS = "󰭜",
				Space = "",
				Tab = "⇨",
			},
		},
		show_help = false,
		show_keys = false,
		disable = {
			ft = { "TelescopePrompt" },
		},
    -- stylua: ignore
    spec = {
      {
        { "<leader>q",  ":q!<cr>",                                                           desc = "Quit" },
        { "<leader>x",  ":bdelete<cr>",                                                      desc = "Close Buffer" },

        { "<leader>d",  group = "Debug",                                                     mode = { "n", "v" } },
        { "<leader>g",  group = "Git",                                                       mode = { "n", "v" } },
        { "<leader>t",  group = "Terminal" },

        { "<leader>l",  group = "LSP",                                                       mode = { "n", "v" } },
        { "<leader>lw", ":lua vim.lsp.buf.add_workspace_folder()<cr>",                       desc = "Add Workspace Folder" },
        { "<leader>lW", ":lua vim.lsp.buf.remove_workspace_folder()<cr>",                    desc = "Remove Workspace Folder" },
        { "<leader>ll", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Workspace Folder" },
        { "<leader>lf", ":lua vim.lsp.buf.format()<CR>",                                     desc = "Format" },
        { "<leader>ld", ":lua vim.diagnostic.open_float()<cr>",                              desc = "Line Diagnostics" },
        { "<leader>lq", ":lua vim.diagnostic.setloclist()<cr>",                              desc = "Quickfix" },
        { "<leader>ls", ":Telescope lsp_document_symbols<cr>",                               desc = "Document Symbols" },
        { "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<cr>",                      desc = "Workspace Symbols" },

        { "<leader>o",  group = "Option", },
        { "<leader>ol", ":terminal live-server<cr>",                                         desc = "Live Server" },
        { "<leader>os", ":set spell!<cr>",                                                   desc = "Toggle Spell " },
        { "<leader>ow", ":set wrap!<cr>",                                                    desc = "Toggle Wrap" },

        { "<leader>p",  group = "Plugin", },
        { "<leader>pi", ":LspInfo<cr>",                                                      desc = "Lsp" },
        { "<leader>pl", ":Lazy<cr>",                                                         desc = "Lazy" },
        { "<leader>pm", ":Mason<cr>",                                                        desc = "Mason" },

        { "<leader>s",  group = "Search",                                                    mode = { "n", "x" } },
        { "<leader>sc", function() Snacks.picker.command_history() end,                      desc = "Cmd History" },
        { "<leader>sC", function() Snacks.picker.colorschemes() end,                         desc = "Colors" },
        { "<leader>so", ":Telescope oldfiles<cr>",                                           desc = "Old Files" },
        { "<leader>sh", ":Telescope help_tags<cr>",                                          desc = "Help Pages" },
        { "<leader>sg", function() Snacks.picker.grep() end,                                 desc = "Grep" },
        { "<leader>sw", function() Snacks.picker.grep_word() end,                            desc = "Grep Word",              mode = { "n", "x" } },
        { "<leader>sm", function() Snacks.picker.marks() end,                                desc = "Marks" },
        { '<leader>s"', function() Snacks.picker.registers() end,                            desc = "Registers" },
      },
    },
	},
}
