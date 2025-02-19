return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeoutlen = 200
	end,
	opts = {
		preset = "modern",
		triggers = {
			{ "<leader>", mode = { "n", "v" } },
		},
		plugins = {
			marks = false, -- shows a list of your marks on ' and `
			registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			presets = {
				operators = false, -- adds help for operators like d, y, ...
				motions = false, -- adds help for motions
				text_objects = false, -- help for text objects triggered after entering an operator
				windows = false, -- default bindings on <c-w>
				nav = false, -- misc bindings to work with windows
				z = false, -- bindings for folds, spelling and others prefixed with z
				g = false, -- bindings for prefixed with g
			},
		},
		win = {
			no_overlap = false,
			title = false,
		},
		icons = {
			breadcrumb = "»",
			separator = "",
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
				Space = "",
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
        { "<leader>e",  ":NvimTreeToggle<cr>",                                               desc = "Explorer", },
        { "<leader>f",  ":Telescope find_files<cr>",                                         desc = "Find Files", },
        { "<leader>q",  ":q!<cr>",                                                           desc = "Quit", },
        { "<leader>x",  ":bdelete<cr>",                                                      desc = "Close Buffer", },

        { "<leader>d",  group = "Debug",                                                     mode = { "n", "v" } },
        { "<leader>g",  group = "Git",                                                       mode = { "n", "v" }, },
        { "<leader>h",  group = "Harpoon" },
        { "<leader>t",  group = "Terminal" },

        { "<leader>l",  group = "LSP",                                                       mode = { "n", "v" } },
        { "<leader>lh", ":lua vim.lsp.buf.signature_help()<cr>",                             desc = "Signature Help", },
        { "<leader>lt", ":lua vim.lsp.buf.type_definition()<cr>",                            desc = "Type Definition", },
        { "<leader>lr", ":lua vim.lsp.buf.rename()<cr>",                                     desc = "Rename", },
        { "<leader>la", ":lua vim.lsp.buf.code_action()<cr>",                                desc = "Code Action",             mode = { "n", "v" } },
        { "<leader>lw", ":lua vim.lsp.buf.add_workspace_folder()<cr>",                       desc = "Add Workspace Folder", },
        { "<leader>lW", ":lua vim.lsp.buf.remove_workspace_folder()<cr>",                    desc = "Remove Workspace Folder", },
        { "<leader>ll", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Workspace Folder", },
        { "<leader>lf", ":lua vim.lsp.buf.format()<CR>",                                     desc = "Format", },
        { "<leader>ld", ":lua vim.diagnostic.open_float()<cr>",                              desc = "Line Diagnostics", },
        { "<leader>lq", ":lua vim.diagnostic.setloclist()<cr>",                              desc = "Quickfix", },
        { "<leader>ls", ":Telescope lsp_document_symbols<cr>",                               desc = "Document Symbols", },
        { "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<cr>",                      desc = "Workspace Symbols", },

        { "<leader>o",  group = "Option", },
        { "<leader>oc", ":set cursorcolumn!<cr>",                                            desc = "Cursor Line", },
        { "<leader>ol", ":terminal live-server<cr>",                                         desc = "Live Server", },
        { "<leader>os", ":set spell!<cr>",                                                   desc = "Toggle Spell ", },
        { "<leader>ow", ":set wrap!<cr>",                                                    desc = "Toggle Wrap", },

        { "<leader>p",  group = "Plugin", },
        { "<leader>pi", ":LspInfo<cr>",                                                      desc = "Lsp", },
        { "<leader>pl", ":Lazy<cr>",                                                         desc = "Lazy", },
        { "<leader>pm", ":Mason<cr>",                                                        desc = "Mason", },

        { "<leader>s",  group = "Search", },
        { "<leader>sc", ":Telescope colorscheme<cr>",                                        desc = "Colorscheme", },
        { "<leader>sg", ":Telescope live_grep<cr>",                                          desc = "Live Grep", },
        { "<leader>sh", ":Telescope help_tags<cr>",                                          desc = "Help Pages", },
        { "<leader>sm", ":Telescope marks<cr>",                                              desc = "Marks", },
        { "<leader>so", ":Telescope oldfiles<cr>",                                           desc = "Recent Files", },
        { "<leader>sr", ":Telescope registers<cr>",                                          desc = "Registers", },
        { "<leader>sw", ":Telescope grep_string<cr>",                                        desc = "Grep Word", },
        { "<leader>sz", ":Telescope command_history<cr>",                                    desc = "Cmd History", },
      },
    },
	},
}
