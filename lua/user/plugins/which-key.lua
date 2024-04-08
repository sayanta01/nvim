return {
	"folke/which-key.nvim",
	keys = { { "<leader>", mode = { "n", "v" } } },
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 299
	end,
	config = function()
		require("which-key").setup({
			plugins = {
				marks = false, -- shows a list of your marks on ' and `
				registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
					motions = false, -- adds help for motions
					text_objects = false, -- help for text objects triggered after entering an operator
					windows = false, -- default bindings on <c-w>
					nav = false, -- misc bindings to work with windows
					z = false, -- bindings for folds, spelling and others prefixed with z
					g = false, -- bindings for prefixed with g
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			operators = { gc = "Comments" },
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<cr>"] = "RET",
				-- ["<tab>"] = "TAB",
			},
			--[[ motions = { ]]
			--[[ 	count = true, ]]
			--[[ }, ]]
			icons = {
				breadcrumb = "»",
				separator = "",
				group = "󰐕",
			},
			popup_mappings = {
				scroll_down = "<c-d>",
				scroll_up = "<c-u>",
			},
			window = {
				border = "rounded",
				position = "bottom",
				margin = { 1, 0, 1, 0 },
				padding = { 1, 2, 1, 2 },
				winblend = 0,
				--[[ zindex = 1000, -- positive value to position WhichKey above other floating windows ]]
			},
			layout = {
				height = { min = 4, max = 24 },
				width = { min = 20, max = 50 },
				spacing = 4,
				align = "left",
			},
			ignore_missing = true,
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
			show_help = false,
			show_keys = false,
			triggers = "auto",
			triggers_blacklist = {
				i = { "j", "k" },
				v = { "j", "k" },
			},
			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt" },
			},
		})

		local opts = {
			mode = "n",
			prefix = "<leader>",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = true,
		}

		local vopts = {
			mode = "v",
			prefix = "<leader>",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = true,
		}

		local vmappings = {
			["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Toggle Comment" },
			l = {
				name = "LSP",
				a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			},
			g = {
				name = "Git",
				s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
				r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			},
		}

		local mappings = {
			[";"] = { "<cmd>Alpha<cr>", "Dashboard" },
			["/"] = { "<Plug>(comment_toggle_linewise_current)", "Toggle Comment" },
			-- w = { ":w!<cr>", "Save" },
			q = { ":q!<cr>", "Quit" },
			x = { ":bdelete<cr>", "Close Buffer" },
			y = { "gg<S-v>G", "Copy" },
			e = { ":NvimTreeToggle<cr>", "Explorer" },
			f = { ":Telescope find_files<cr>", "Find Files" },

			g = {
				name = "Git",
				g = { ":lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
				o = { ":Telescope git_status<cr>", "Open Status" },
				b = { ":Telescope git_branches<cr>", "Checkout Branch" },
				c = { ":Telescope git_commits<cr>", "Checkout Commit" },
				C = { ":Telescope git_bcommits<cr>", "Checkout Commit (current file)" },
				j = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
				k = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
				l = { ":lua require 'gitsigns'.blame_line()<cr>", "Blame" },
				s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
				S = { ":lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer" },
				r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
				R = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
				u = { ":lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
				d = { ":lua require 'gitsigns'.toggle_deleted()<cr>", "Toggle Deleted" },
				D = {
					":Gitsigns diffthis HEAD<cr>",
					"Git Diff",
				},
			},

			l = {
				name = "LSP",
				d = { ":lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
				h = { ":lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
				t = { ":lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
				r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
				a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				w = { ":lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
				W = { ":lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
				l = { ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folder" },
				f = { ":lua vim.lsp.buf.format()<CR>", "Format" },
				q = { ":lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
				s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
				S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
			},

			s = {
				name = "Telescope",
				c = { ":Telescope colorscheme<cr>", "Colorscheme" },
				t = { ":Telescope live_grep<cr>", "Find Text" },
        g = { ":Telescope grep_string<cr>", "Grep String" },
				h = { ":Telescope help_tags<cr>", "Help Pages" },
				o = { ":Telescope oldfiles<cr>", "Recent Files" },
				r = { ":Telescope registers<cr>", "Registers" },
        m = { ":Telescope marks<cr>", "Marks" },
        z = { ":Telescope command_history<cr>", "Cmd History" },
        -- i = { ":lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
        -- p = { ":Telescope projects<cr>", "Projects" },
			},

			h = {
				name = "Harpoon",
				h = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon marks" },
				m = {
					":lua require('harpoon.mark').add_file() vim.notify '󰤱 Marked file'<cr>",
					"Mark to harpoon",
				},
				r = {
					":lua require('harpoon.mark').rm_file() vim.notify 'Removed file'<cr>",
					"Remove mark",
				},
				n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next harpoon" },
				p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev harpoon" },
			},

			o = {
				name = "Option",
				h = { ":ColorizerToggle<cr>", "Toggle Colors" },
				s = { ":set spell!<cr>", "Toggle Spelling " },
				w = { ":set wrap!<cr>", "Toggle Wrap" },
				-- l = { ":set cursorcolumn!<cr>", "Cursor Line" },
				-- u = { ":UfoAttach<cr>", "Ufo" },
				p = { ":MarkdownPreviewToggle<cr>", "Markdown Preview" },
			},

			p = {
				name = "Plugin",
				m = { ":Mason<cr>", "Mason" },
				n = { ":NullLsInfo<cr>", "NullLs" },
				l = { ":Lazy<cr>", "Lazy" },
			},

			b = {
				b = { ":Telescope buffers<cr>", "Buf Preview" },
				n = { ":enew<cr>", "New Buffer" },
				-- h = { ":BufferLineCloseLeft<cr>", "Close all to Left" },
				-- l = { ":BufferLineCloseRight<cr>", "Close all to Right" },
			},

			d = {
				name = "Debug",
				t = { ":lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
				c = { ":lua require'dap'.continue()<cr>", "Continue" },
				C = { ":lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
				o = { ":lua require'dap'.step_over()<cr>", "Step Over" },
				i = { ":lua require'dap'.step_into()<cr>", "Step Into" },
				u = { ":lua require'dap'.step_out()<cr>", "Step Out" },
				r = { ":lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
				l = { ":lua require'dap'.run_last()<cr>", "Last Run" },
				b = { ":lua require'dap'.step_back()<cr>", "Step Back" },
				s = { ":lua require'dap'.session()<cr>", "Get Session" },
				x = { ":lua require'dap'.terminate()<cr>", "Terminate" },
				p = { ":lua require'dap'.pause()<cr>", "Pause" },
        d = { ":lua require'dap'.disconnect()<cr>", "Disconnect" },
				-- j = { ":lua require'dap'.down()<cr>", "Down" },
        -- k = { ":lua require'dap'.up()<cr>", "Up" },
			},

			t = {
				name = "Terminal",
				h = { ":ToggleTerm size=14 direction=horizontal<cr>", "Horizontal" },
				v = { ":ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
			},
		}

		local terminal = require("toggleterm.terminal").Terminal
		local lazygit = terminal:new({ cmd = "lazygit", hidden = true })

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		require("which-key").register(mappings, opts)
		require("which-key").register(vmappings, vopts)
	end,
}
