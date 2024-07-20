return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = { { "<leader>", mode = { "n", "v" } } },
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 400
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
			border = "rounded",
			padding = { 1, 2 },
			title = false,
		},
		icons = {
			breadcrumb = "»",
			separator = "",
			group = "",
			mappings = false,
			keys = {
				Up = "↑ ",
				Down = "↓ ",
				Left = "← ",
				Right = "→ ",
				C = " ",
				M = "⌥ ",
				CR = "↩︎ ",
				NL = "↩︎ ",
				BS = " ",
				Space = "␣ ",
				Tab = "⇨ ",
			},
		},
		show_help = false,
		show_keys = false,
		disable = {
			ft = { "lazy", "TelescopePrompt" },
		},
		spec = {
      -- stylua: ignore
      {
        mode = { "n" },
        { "<leader>e",  ":NvimTreeToggle<cr>",                                               desc = "Explorer", },
        { "<leader>f",  ":Telescope find_files<cr>",                                         desc = "Find Files", },
        { "<leader>q",  ":q!<cr>",                                                           desc = "Quit", },
        { "<leader>x",  ":bdelete<cr>",                                                      desc = "Close Buffer", },
        -- { "<leader>y",  "gg<S-v>G<cr>",                                                         desc = "Select All", },

        -- { "<leader>b",  group = "Buffer", },
        -- { "<leader>bb", ":Telescope buffers<cr>",                                               desc = "Buf Preview", },
        -- { "<leader>bn", ":enew<cr>",                                                            desc = "New Buffer", },

        { "<leader>d",  group = "Debug",                                                     mode = { "n", "v" } },
        { "<leader>dt", function() require("dap").toggle_breakpoint() end,                   desc = "Toggle Breakpoint" },
        -- { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        { "<leader>dc", function() require("dap").continue() end,                            desc = "Continue" },
        { "<leader>dC", function() require("dap").run_to_cursor() end,                       desc = "Run to Cursor" },
        { "<leader>di", function() require("dap").step_into() end,                           desc = "Step Into" },
        { "<leader>do", function() require("dap").step_over() end,                           desc = "Step Over" },
        { "<leader>du", function() require("dap").step_out() end,                            desc = "Step Out" },
        { "<leader>dr", function() require("dap").repl.toggle() end,                         desc = "Toggle REPL" },
        { "<leader>db", function() require("dap").step_back() end,                           desc = "Step Back" },
        { "<leader>dp", function() require("dap").pause() end,                               desc = "Pause" },
        { "<leader>dl", function() require("dap").run_last() end,                            desc = "Last Run" },
        -- { "<leader>dg", function() require("dap").goto_() end,                                  desc = "Go to Line (No Execute)" },
        -- { "<leader>ds", function() require("dap").session() end,                                desc = "Get Session" },
        { "<leader>dx", function() require("dap").terminate() end,                           desc = "Terminate" },


        { "<leader>g",  group = "Git",                                                       mode = { "n", "v" }, },
        -- { "<leader>gt", ":Telescope git_status<cr>",                                            desc = "Status", },
        -- { "<leader>gb", ":Telescope git_branches<cr>",                                          desc = "Branches", },
        { "<leader>gc", ":Telescope git_commits<cr>",                                        desc = "Commits", },
        { "<leader>gC", ":Telescope git_bcommits<cr>",                                       desc = "Commits (current file)", },
        -- { "<leader>gb", ":lua require 'gitsigns'.blame_line()<cr>",                             desc = "Blame Line", },
        -- { "<leader>gd", ":lua require 'gitsigns'.toggle_deleted()<cr>",                         desc = "Toggle Deleted", },
        -- { "<leader>gD", ":Gitsigns diffthis HEAD<cr>",                                          desc = "Diff This ~", },

        { "<leader>l",  group = "LSP",                                                       mode = { "n", "v" } },
        { "<leader>ld", ":lua vim.lsp.buf.declaration()<cr>",                                desc = "Goto Declaration", },
        { "<leader>lh", ":lua vim.lsp.buf.signature_help()<cr>",                             desc = "Signature Help", },
        { "<leader>lt", ":lua vim.lsp.buf.type_definition()<cr>",                            desc = "Type Definition", },
        { "<leader>lr", ":lua vim.lsp.buf.rename()<cr>",                                     desc = "Rename", },
        { "<leader>la", ":lua vim.lsp.buf.code_action()<cr>",                                desc = "Code Action",             mode = { "n", "v" } },
        { "<leader>lw", ":lua vim.lsp.buf.add_workspace_folder()<cr>",                       desc = "Add Workspace Folder", },
        { "<leader>lW", ":lua vim.lsp.buf.remove_workspace_folder()<cr>",                    desc = "Remove Workspace Folder", },
        { "<leader>ll", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Workspace Folder", },
        { "<leader>lf", ":lua vim.lsp.buf.format()<CR>",                                     desc = "Format", },
        { "<leader>lq", ":lua vim.diagnostic.setloclist()<cr>",                              desc = "Quickfix", },
        { "<leader>ls", ":Telescope lsp_document_symbols<cr>",                               desc = "Document Symbols", },
        { "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<cr>",                      desc = "Workspace Symbols", },

        { "<leader>o",  group = "Option", },
        { "<leader>oc", ":set cursorcolumn!<cr>",                                            desc = "Cursor Line", },
        { "<leader>oh", ":HighlightColors Toggle<cr>",                                       desc = "Toggle Colors", },
        { "<leader>ol", ":terminal live-server<cr>",                                         desc = "Live Server", },
        { "<leader>op", ":MarkdownPreviewToggle<cr>",                                        desc = "Markdown Preview", },
        { "<leader>os", ":set spell!<cr>",                                                   desc = "Toggle Spell ", },
        { "<leader>ow", ":set wrap!<cr>",                                                    desc = "Toggle Wrap", },

        { "<leader>p",  group = "Plugin", },
        { "<leader>pl", ":LspInfo<cr>",                                                      desc = "Lsp", },
        { "<leader>pm", ":Mason<cr>",                                                        desc = "Mason", },
        { "<leader>pn", ":NullLsInfo<cr>",                                                   desc = "NullLs", },
        { "<leader>pp", ":Lazy<cr>",                                                         desc = "Lazy", },

        { "<leader>s",  group = "Telescope", },
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
