local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = false,
		registers = false,
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20,
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
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
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = " ",
		separator = " ",
		group = "",
	},
	popup_mappings = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},
	window = {
		border = "rounded", -- none, shadow
		position = "bottom", -- top
		margin = { 0, 0, 0, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 24 },
		width = { min = 20, max = 50 },
		spacing = 2,
		align = "left",
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
	disable = {
		buftypes = {},
		filetypes = { "TelescopePrompt" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	[";"] = { "<cmd>Alpha<cr>", "Dashboard" },
	["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment Toggle  " },
	w = { ":w!<cr>", "Save" },
	q = { ":q!<cr>", "quit" },
	x = { ":bdelete<cr>", "Close Buffer" },
	h = { ":nohlsearch<cr>", "No Highlight" },
	y = { "gg<S-v>G", "Copy" },
	e = { ":NvimTreeToggle<cr>", "NvimTree" },
	--[[ E = { ":e ~/.config/nvim/init.lua<cr>", "init" }, ]]
	f = { ":Telescope find_files<cr>", "Find Files" },
	--[[ f = { ]]
	--[[ 	":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", ]]
	--[[ 	"Find Files", ]]
	--[[ }, ]]
	r = { ":Telescope live_grep<cr>", "Find Text" },
	g = {
		name = "Git",
		g = { ":lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
		o = { ":Telescope git_status<cr>", "Open Changed File" },
		b = { ":Telescope git_branches<cr>", "Checkout Branch" },
		c = { ":Telescope git_commits<cr>", "Checkout Commit" },
		C = {
			":Telescope git_bcommits<cr>",
			"Checkout commit (current file)  ",
		},
		j = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { ":lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { ":lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		d = { ":Gitsigns diffthis HEAD<cr>", "Diff" },
	},
	l = {
		name = "LSP",
		d = { ":lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
		D = { ":lua vim.lsp.buf.definition()<cr>", "Goto Definition" },
		-- k = { ":lua vim.lsp.buf.hover()<cr>", "Hover" },
		--[[ R = { ":lua vim.lsp.buf.references()<cr>", "References" }, ]]
		-- h = { ":lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		-- n = { ":lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
		-- p = { ":lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		t = { ":lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
		f = { ":lua vim.lsp.buf.format()<CR>", "Format" },
		a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Actions" },
		q = { ":lua vim.diagnostic.setloclist()<cr>", "quickfix" },
		I = { ":LspInfo<cr>", "Info" },
		w = { ":lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
		W = { ":lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
		l = { ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folder" },
		s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		c = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		i = { ":lua vim.lsp.buf.incoming_calls()<CR>", "Incoming Calls" },
		o = { ":lua vim.lsp.buf.outgoing_calls()<CR>", "Outgoing Calls" },
	},
	--[[ s = { ]]
	--[[ name = "Saga", ]]
	--[[ f = { ":Lspsaga lsp_finder<CR>", "Finder" }, ]]
	--[[ d = { ":Lspsaga goto_definition<CR>", "Goto Definition" }, ]]
	--[[ s = { ":Lspsaga peek_definition<CR>", "Peek Definition" }, ]]
	--[[ r = { ":Lspsaga rename<CR>", "Rename" }, ]]
	--[[ a = { ":Lspsaga code_action<CR>", "Code Action" }, ]]
	--[[ c = { ":Lspsaga show_cursor_diagnostics<CR>", "Cursor Diagnostics  " }, ]]

	--[[ n = { ":Lspsaga diagnostic_jump_next<CR>", "Next Diagnostics" }, ]]
	--[[ p = { ":Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostics" }, ]]
	--[[ l = { ":Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" }, ]]
	--[[ b = { ":Lspsaga show_buf_diagnostics<CR>", "Buffer Diagnostics " }, ]]
	--[[ keymap("n", "[E", function() ]]
	--[[ require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR }) ]]
	--[[ end), ]]
	--[[ keymap("n", "]E", function() ]]
	--[[ require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR }) ]]
	--[[ end), ]]

	-- Toggle outline
	--[[ o = { ":Lspsaga outline<CR>", "Outline" }, ]]
	--[[ h = { ":Lspsaga hover_doc<CR>", "Hover" }, ]]
	--[[ i = { ":Lspsaga incoming_calls<CR>", "Incoming Calls" }, ]]
	--[[ g = { ":Lspsaga outgoing_calls<CR>", "Outgoing Calls" }, ]]
	-- t = { ":Lspsaga term_toggle<CR>", "Terminal" },
	--[[ }, ]]
	s = {
		name = "Telescope",
		t = { ":Telescope colorscheme<cr>", "Themes" },
		c = { ":Telescope commands<cr>", "Commands" },
		b = { ":Telescope builtin<cr>", "Telescope Builtin" },
		d = { ":Telescope diagnostics<cr>", "Document Diagnostics  " },
		h = { ":Telescope help_tags<cr>", "Find Help" },
		H = { ":Telescope highlights<cr>", "Find Highlights" },
		i = { ":lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
		k = { ":Telescope keymaps<cr>", "Keymaps" },
		r = { ":Telescope oldfiles<cr>", "Recent Files" },
		s = { ":Telescope grep_string<cr>", "Find String" },
		p = { ":Telescope projects<cr>", "Projects" },
		z = { ":Telescope command_history<cr>", "Cmd Histroy" },
		R = { ":Telescope registers<cr>", "Registers" },
		l = { ":Telescope resume<cr>", "Last Search" },
		m = { ":Telescope marks<cr>", "Marks" },
		--[[ f = { ":Telescope lsp_references<cr>", "References" }, ]]
	},
	o = {
		name = "Options",
		s = { ":set spell!<cr>", "Toggle Spell Check" },
		x = { ":!chmod +x %<cr>", "Chmod +x" },
		v = { ":VimBeGood<cr>", "Vim Practice" },
		c = { ":CccPick<cr>", "Color Picker" },
		f = { ":CccConvert<cr>", "Change Color Format" },
		h = { ":CccHighlighterToggle<cr>", "Toggle Colors" },
		t = { ":ColorizerToggle<cr>", "Colorizer Toggle" },
		n = { ":set rnu!<cr>", "Relative Nm" },
		l = { ":set cursorcolumn!<cr>", "Cursor Column" },
		z = { ":ZenMode<cr>", "Zen-Mode" },
		w = { ":set wrap<cr>", "Wrap Text" },
		W = { ":set nowrap<cr>", "No Wrap" },
		m = { ":set showmode!<cr>", "Show Mode (statusline)  " },
		p = { ":MarkdownPreviewToggle<cr>", "Markdown Preview" },
	},
	p = {
		name = "Plugin",
		m = { ":Mason<cr>", "Mason" },
		n = { ":NullLsInfo<cr>", "NullLs" },
		l = { ":Lazy<cr>", "Lazy" },
		i = { ":Lazy install<cr>", "Install Plugins" },
		x = { ":Lazy clean<cr>", "Remove Unused Plugins" },
		u = { ":Lazy update<cr>", "Update Plugins" },
		b = { ":Lazy build<cr>", "Build Plugins" },
		s = { ":Lazy sync<cr>", "Sync Plugins" },
		c = { ":Lazy check<cr>", "Check" },
	},
	b = {
		name = "Buffer",
		--[[ b = { ]]
		--[[ 	":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", ]]
		--[[ 	"Buf Prev", ]]
		--[[ }, ]]
		b = { ":Telescope buffers<cr>", "Buf Prev" },
		h = { ":BufferLineCloseLeft<cr>", "Close all to Left" },
		l = { ":BufferLineCloseRight<cr>", "Close all to Right" },
		p = { ":BufferLineTogglePin<cr>", "Toggle Pin" },
	},
	d = {
		name = "Debug",
		t = { ":lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		b = { ":lua require'dap'.step_back()<cr>", "Step Back" },
		c = { ":lua require'dap'.continue()<cr>", "Continue" },
		C = { ":lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		d = { ":lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { ":lua require'dap'.session()<cr>", "Get Session" },
		i = { ":lua require'dap'.step_into()<cr>", "Step Into" },
		o = { ":lua require'dap'.step_over()<cr>", "Step Over" },
		O = { ":lua require'dap'.step_out()<cr>", "Step Out" },
		p = { ":lua require'dap'.pause()<cr>", "Pause" },
		r = { ":lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		q = { ":lua require'dap'.close()<cr>", "Close" },
		u = { ":lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
		l = { ":lua require'dap'.run_last()<cr>", "Last Run" },
		x = { ":lua require'dap'.terminate()<cr>", "Terminate" },
		--[[ dap-python ]]
		m = { ":lua require('dap-python').test_method()<cr>", "Py Test Method" },
		f = { ":lua require('dap-python').test_class()<cr>", "Py Test Class" },
		s = { "<ESC>:lua require('dap-python').debug_selection()<CR>", "Py Debug Selection" },
		--[[ dap-go ]]
		e = { ":lua require('dap-go').debug_test()<cr>", "Go Debug Test" },
		a = { ":lua require('dap-go').debug_last_test()<cr>", "Go Last Test" },
	},
	t = {
		name = "Terminal",
		h = { ":ToggleTerm size=14 direction=horizontal<cr>", "Horizontal" },
		v = { ":ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		n = { ":lua _NODE_TOGGLE()<cr>", "Node" },
		p = { ":lua _PYTHON_TOGGLE()<cr>", "Python" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
