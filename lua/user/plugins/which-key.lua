return {
	"folke/which-key.nvim",
	-- keys = { { "<leader>", mode = { "n", "v" } } },
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 400
	end,
	opts = {
		preset = "modern",
		modes = {
			n = true,
			i = false,
			x = false,
			s = false,
			o = false,
			t = false,
			c = false,
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
			rules = false,
			keys = {
				Up = "↑ ",
				Down = "↓ ",
				Left = "← ",
				Right = "→ ",
				C = " ",
				M = "⌥ ",
				S = "⇪ ",
				CR = "↩︎ ",
				NL = "↩︎ ",
				BS = " ",
				Space = "␠ ",
				Tab = "⇨ ",
			},
		},
		show_help = false,
		show_keys = false,
		disable = {
			ft = { "TelescopePrompt" },
		},
		spec = {
      -- stylua: ignore
      {
        mode = { "n", "v" },
        { "<leader>e",  ":NvimTreeToggle<cr>",                                                  desc = "Explorer",                       nowait = true, remap = false },
        { "<leader>f",  ":Telescope find_files<cr>",                                            desc = "Find Files",                     nowait = true, remap = false },
        { "<leader>q",  ":q!<cr>",                                                              desc = "Quit",                           nowait = true, remap = false },
        { "<leader>x",  ":bdelete<cr>",                                                         desc = "Close Buffer",                   nowait = true, remap = false },
        -- { "<leader>y",  "gg<S-v>G<cr>",                                                         desc = "Close Buffer",                   nowait = true, remap = false },

        { "<leader>b",  group = "Buffer",                                                       nowait = true,                           remap = false },
        { "<leader>bb", ":Telescope buffers<cr>",                                               desc = "Buf Preview",                    nowait = true, remap = false },
        { "<leader>bn", ":enew<cr>",                                                            desc = "New Buffer",                     nowait = true, remap = false },

        { "<leader>d",  group = "Debug",                                                        nowait = true,                           remap = false },
        { "<leader>dt", ":lua require'dap'.toggle_breakpoint()<cr>",                            desc = "Toggle Breakpoint",              nowait = true, remap = false },
        { "<leader>dc", ":lua require'dap'.continue()<cr>",                                     desc = "Continue",                       nowait = true, remap = false },
        { "<leader>dC", ":lua require'dap'.run_to_cursor()<cr>",                                desc = "Run to Cursor",                  nowait = true, remap = false },
        { "<leader>do", ":lua require'dap'.step_over()<cr>",                                    desc = "Step Over",                      nowait = true, remap = false },
        { "<leader>di", ":lua require'dap'.step_into()<cr>",                                    desc = "Step Into",                      nowait = true, remap = false },
        { "<leader>du", ":lua require'dap'.step_out()<cr>",                                     desc = "Step Out",                       nowait = true, remap = false },
        { "<leader>dr", ":lua require'dap'.repl.toggle()<cr>",                                  desc = "Toggle Repl",                    nowait = true, remap = false },
        { "<leader>db", ":lua require'dap'.step_back()<cr>",                                    desc = "Step Back",                      nowait = true, remap = false },
        { "<leader>ds", ":lua require'dap'.session()<cr>",                                      desc = "Get Session",                    nowait = true, remap = false },
        { "<leader>dp", ":lua require'dap'.pause()<cr>",                                        desc = "Pause",                          nowait = true, remap = false },
        { "<leader>dl", ":lua require'dap'.run_last()<cr>",                                     desc = "Last Run",                       nowait = true, remap = false },
        { "<leader>dx", ":lua require'dap'.terminate()<cr>",                                    desc = "Terminate",                      nowait = true, remap = false },
        -- { "<leader>dd", ":lua require'dap'.disconnect()<cr>",                                   desc = "Disconnect",                     nowait = true, remap = false },
        -- { "<leader>dw", "lua require'dap'.ui.widgets.hover()<cr>",                              desc = "Widgets",                        nowait = true, remap = false },

        { "<leader>g",  group = "Git",                                                          nowait = true,                           remap = false },
        -- { "<leader>gg", ":lua _LAZYGIT_TOGGLE()<cr>",                                           desc = "Lazygit",                        nowait = true, remap = false },
        { "<leader>gt", ":Telescope git_status<cr>",                                            desc = "Git Status",                     nowait = true, remap = false },
        { "<leader>gb", ":Telescope git_branches<cr>",                                          desc = "Checkout Branch",                nowait = true, remap = false },
        { "<leader>gc", ":Telescope git_commits<cr>",                                           desc = "Checkout Commit",                nowait = true, remap = false },
        { "<leader>gC", ":Telescope git_bcommits<cr>",                                          desc = "Checkout Commit (current file)", nowait = true, remap = false },
        { "<leader>gs", ":lua require 'gitsigns'.stage_hunk()<cr>",                             desc = "Stage Hunk",                     nowait = true, remap = false },
        { "<leader>gr", ":lua require 'gitsigns'.reset_hunk()<cr>",                             desc = "Reset Hunk",                     nowait = true, remap = false },
        { "<leader>gS", ":lua require 'gitsigns'.stage_buffer()<cr>",                           desc = "Stage Buffer",                   nowait = true, remap = false },
        { "<leader>gR", ":lua require 'gitsigns'.reset_buffer()<cr>",                           desc = "Reset Buffer",                   nowait = true, remap = false },
        { "<leader>gu", ":lua require 'gitsigns'.undo_stage_hunk()<cr>",                        desc = "Undo Stage Hunk",                nowait = true, remap = false },
        { "<leader>gp", ":lua require 'gitsigns'.preview_hunk()<cr>",                           desc = "Preview Hunk",                   nowait = true, remap = false },
        { "<leader>gl", ":lua require 'gitsigns'.blame_line()<cr>",                             desc = "Blame",                          nowait = true, remap = false },
        { "<leader>gd", ":lua require 'gitsigns'.toggle_deleted()<cr>",                         desc = "Toggle Deleted",                 nowait = true, remap = false },
        { "<leader>gD", ":Gitsigns diffthis HEAD<cr>",                                          desc = "Git Diff",                       nowait = true, remap = false },

        { "<leader>h",  group = "Harpoon",                                                      nowait = true,                           remap = false },
        { "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<cr>",                   desc = "Harpoon marks",                  nowait = true, remap = false },
        { "<leader>hm", ":lua require('harpoon.mark').add_file() vim.notify 'Marked file'<cr>", desc = "Mark to harpoon",                nowait = true, remap = false },
        { "<leader>hn", ":lua require('harpoon.ui').nav_next()<cr>",                            desc = "Next",                           nowait = true, remap = false },
        { "<leader>hp", ":lua require('harpoon.ui').nav_prev()<cr>",                            desc = "Prev",                           nowait = true, remap = false },

        { "<leader>l",  group = "LSP",                                                          nowait = true,                           remap = false },
        { "<leader>ld", ":lua vim.lsp.buf.declaration()<cr>",                                   desc = "Goto Declaration",               nowait = true, remap = false },
        { "<leader>lh", ":lua vim.lsp.buf.signature_help()<cr>",                                desc = "Signature Help",                 nowait = true, remap = false },
        { "<leader>lt", ":lua vim.lsp.buf.type_definition()<cr>",                               desc = "Type Definition",                nowait = true, remap = false },
        { "<leader>lr", ":lua vim.lsp.buf.rename()<cr>",                                        desc = "Rename",                         nowait = true, remap = false },
        { "<leader>la", ":lua vim.lsp.buf.code_action()<cr>",                                   desc = "Code Action",                    nowait = true, remap = false },
        { "<leader>lw", ":lua vim.lsp.buf.add_workspace_folder()<cr>",                          desc = "Add Workspace Folder",           nowait = true, remap = false },
        { "<leader>lW", ":lua vim.lsp.buf.remove_workspace_folder()<cr>",                       desc = "Remove Workspace Folder",        nowait = true, remap = false },
        { "<leader>ll", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",    desc = "List Workspace Folder",          nowait = true, remap = false },
        { "<leader>lf", ":lua vim.lsp.buf.format()<CR>",                                        desc = "Format",                         nowait = true, remap = false },
        { "<leader>lq", ":lua vim.diagnostic.setloclist()<cr>",                                 desc = "Quickfix",                       nowait = true, remap = false },
        { "<leader>ls", ":Telescope lsp_document_symbols<cr>",                                  desc = "Document Symbols",               nowait = true, remap = false },
        { "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<cr>",                         desc = "Workspace Symbols",              nowait = true, remap = false },

        { "<leader>o",  group = "Option",                                                       nowait = true,                           remap = false },
        { "<leader>oh", ":HighlightColors Toggle<cr>",                                          desc = "Toggle Colors",                  nowait = true, remap = false },
        { "<leader>ol", ":terminal live-server<cr>",                                            desc = "Live Server",                    nowait = true, remap = false },
        { "<leader>op", ":MarkdownPreviewToggle<cr>",                                           desc = "Markdown Preview",               nowait = true, remap = false },
        { "<leader>os", ":set spell!<cr>",                                                      desc = "Toggle Spelling ",               nowait = true, remap = false },
        { "<leader>ow", ":set wrap!<cr>",                                                       desc = "Toggle Wrap",                    nowait = true, remap = false },
        -- { "<leader>ou", ":UfoAttach<cr>",                                                       desc = "Ufo",                            nowait = true, remap = false },

        { "<leader>p",  group = "Plugin",                                                       nowait = true,                           remap = false },
        { "<leader>pl", ":Lazy<cr>",                                                            desc = "Lazy",                           nowait = true, remap = false },
        { "<leader>pm", ":Mason<cr>",                                                           desc = "Mason",                          nowait = true, remap = false },
        { "<leader>pn", ":NullLsInfo<cr>",                                                      desc = "NullLs",                         nowait = true, remap = false },

        { "<leader>s",  group = "Telescope",                                                    nowait = true,                           remap = false },
        { "<leader>sc", ":Telescope colorscheme<cr>",                                           desc = "Colorscheme",                    nowait = true, remap = false },
        { "<leader>sg", ":Telescope live_grep<cr>",                                             desc = "Live Grep",                      nowait = true, remap = false },
        { "<leader>sh", ":Telescope help_tags<cr>",                                             desc = "Help Pages",                     nowait = true, remap = false },
        { "<leader>sm", ":Telescope marks<cr>",                                                 desc = "Marks",                          nowait = true, remap = false },
        { "<leader>so", ":Telescope oldfiles<cr>",                                              desc = "Recent Files",                   nowait = true, remap = false },
        { "<leader>sr", ":Telescope registers<cr>",                                             desc = "Registers",                      nowait = true, remap = false },
        { "<leader>sw", ":Telescope grep_string<cr>",                                           desc = "Grep Word",                      nowait = true, remap = false },
        { "<leader>sz", ":Telescope command_history<cr>",                                       desc = "Cmd History",                    nowait = true, remap = false },

        -- { "<leader>t",  group = "Terminal",                                                     nowait = true,                           remap = false },
        -- { "<leader>th", ":ToggleTerm size=14 direction=horizontal<cr>",                         desc = "Horizontal",                     nowait = true, remap = false },
        -- { "<leader>tv", ":ToggleTerm size=80 direction=vertical<cr>",                           desc = "Vertical",                       nowait = true, remap = false },
      },
		},
	},
}
