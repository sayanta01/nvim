return {
	"folke/which-key.nvim",
	--[[ event = "VimEnter", ]]
	event = "VeryLazy",
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
				breadcrumb = " ",
				separator = " ",
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
				spacing = 2,
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
			["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment Toggle (visual)" },
			l = {
				name = "LSP",
				a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			},
		}

		local mappings = {
			[";"] = { "<cmd>Alpha<cr>", "Dashboard" },
			["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment Toggle" },
			w = { ":w!<cr>", "Save" },
			q = { ":q!<cr>", "quit" },
			x = { ":bdelete<cr>", "Close Buffer" },
			n = { ":nohlsearch<cr>", "No Highlight" },
			y = { "gg<S-v>G", "Copy" },
			e = { ":NvimTreeToggle<cr>", "Explorer" },
			f = { ":Telescope find_files<cr>", "Find Files" },

			g = {
				name = "Git",
				g = { ":lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
				o = { ":Telescope git_status<cr>", "Open Changed File" },
				b = { ":Telescope git_branches<cr>", "Checkout Branch" },
				c = { ":Telescope git_commits<cr>", "Checkout Commit" },
				C = { ":Telescope git_bcommits<cr>", "Checkout commit (current file)" },
				j = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
				k = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
				l = { ":lua require 'gitsigns'.blame_line()<cr>", "Blame" },
				p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
				r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
				s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
				R = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
				u = { ":lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
				d = { ":Gitsigns diffthis HEAD<cr>", "Diff" },
			},

			l = {
				name = "LSP",
				t = { ":lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
				r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
				f = { ":lua vim.lsp.buf.format()<CR>", "Format" },
				a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				q = { ":lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
				w = { ":lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
				W = { ":lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
				l = { ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folder" },
				s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
				S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
				c = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			},

			s = {
				name = "Telescope",
				c = { ":Telescope colorscheme<cr>", "Themes" },
				i = { ":lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
				t = { ":Telescope live_grep<cr>", "Find Text" },
				p = { ":Telescope projects<cr>", "Projects" },
				z = { ":Telescope command_history<cr>", "Cmd History" },
				o = { ":Telescope oldfiles<cr>", "Recent Files" },
				r = { ":Telescope registers<cr>", "Registers" },
				g = { ":Telescope grep_string<cr>", "Find String" },
				m = { ":Telescope marks<cr>", "Marks" },
			},

			h = {
				name = "Harpoon",
				h = { ":Telescope harpoon marks<cr>", "Telescope harpoon" },
				m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file with harpoon" },
				n = { ":lua require('harpoon.ui').nav_next()<cr>", "Go to next harpoon mark" },
				p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Go to previous harpoon mark" },
			},

			o = {
				name = "Option",
				s = { ":set spell!<cr>", "Toggle Spell Check" },
				x = { ":!chmod +x %<cr>", "Chmod 󰐕X" },
				c = { ":CccPick<cr>", "Color Picker" },
				f = { ":CccConvert<cr>", "Change Color Format" },
				h = { ":CccHighlighterToggle<cr>", "Toggle Colors" },
				l = { ":set cursorcolumn!<cr>", "Cursor Column" },
				p = { ":MarkdownPreviewToggle<cr>", "Markdown Preview" },
				v = { ":VimBeGood<cr>", "Vim Practice" },
				w = { ":set wrap!<cr>", "Toggle Wrap Text" },
			},

			p = {
				name = "Plugin",
				m = { ":Mason<cr>", "Mason" },
				n = { ":NullLsInfo<cr>", "NullLs" },
				l = { ":Lazy<cr>", "Lazy" },
			},

			b = {
				b = { ":Telescope buffers<cr>", "Buf Prev" },
				h = { ":BufferLineCloseLeft<cr>", "Close all to Left" },
				l = { ":BufferLineCloseRight<cr>", "Close all to Right" },
			},

			d = {
				name = "Debug",
				t = { ":lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
				c = { ":lua require'dap'.continue()<cr>", "Continue" },
				C = { ":lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
				g = { ":lua require'dap'.session()<cr>", "Get Session" },
				o = { ":lua require'dap'.step_over()<cr>", "Step Over" },
				i = { ":lua require'dap'.step_into()<cr>", "Step Into" },
				u = { ":lua require'dap'.step_out()<cr>", "Step Out" },
				p = { ":lua require'dap'.pause()<cr>", "Pause" },
				r = { ":lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
				q = { ":lua require'dap'.close()<cr>", "Quit" },
				l = { ":lua require'dap'.run_last()<cr>", "Last Run" },
				x = { ":lua require'dap'.terminate()<cr>", "Terminate" },
				b = { ":lua require'dap'.step_back()<cr>", "Step Back" },
				d = { ":lua require'dap'.disconnect()<cr>", "Disconnect" },
				U = { ":lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
			},
			D = {
				name = "Lang-Debug",
				m = { ":lua require('dap-python').test_method()<cr>", "󰌠 Test Method" },
				c = { ":lua require('dap-python').test_class()<cr>", "󰌠 Test Class" },
				t = { ":lua require('dap-go').debug_test()<cr>", " Debug Test" },
				l = { ":lua require('dap-go').debug_last_test()<cr>", " Last Test" },
			},

			t = {
				name = "Terminal",
				h = { ":ToggleTerm size=14 direction=horizontal<cr>", "Horizontal" },
				v = { ":ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
				n = { ":lua _NODE_TOGGLE()<cr>", "Node" },
				p = { ":lua _PYTHON_TOGGLE()<cr>", "Python" },
			},
		}

		require("which-key").register(mappings, opts)
		require("which-key").register(vmappings, vopts)
	end,
}
