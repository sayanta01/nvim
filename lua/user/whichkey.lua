local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20,
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
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
    breadcrumb = "»",
    separator = " ",
    group = "+",
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
   w = { "<cmd>w!<cr>", "Save" },
   W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
   q = { "<cmd>q!<cr>", "Quit" },
   Q = { ":wq<cr>", "Save & Quit" },
   x = {":bdelete<cr>", "Close Buffer"},
   X = {":bdelete!<cr>", "Force Close Buffer"},
   ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
   b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers"},
   e = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
   c = { ":e ~/.config/nvim/init.lua<cr>", "Edit Config" },
   f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Find Files"},
   --f = {"<cmd>Telescope find_files<cr>", "Find Files"},
   r = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
   i = { "<cmd>Telescope media_files<cr>", "Media files" },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
          "<cmd>Telescope git_bcommits<cr>",
          "Checkout commit(for current file)",
        },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
  },

  l = {
    name = "LSP",
    a = {'<cmd>lua vim.lsp.buf.code_action()<cr>', "Code actions"},
    f = {'<cmd>lua vim.lsp.buf.format { async = true }()<cr>', "Format File"},
    r = {'<cmd>lua vim.lsp.buf.rename()<cr>', "Rename"},
    i = {'<cmd>LspInstallInfo<cr>', 'Install language server'},
    I = {":LspInfo<cr>", "Connected Language Servers"},
    w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add workspace folder"},
    W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove workspace folder"},
    n = {'<cmd>lua vim.diagnostic.goto_next()<cr>', "Go to next diagnostic"},
    p = {'<cmd>lua vim.diagnostic.goto_prev()<cr>', "Go to previous diagnostic"},
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"},
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    L = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', "List workspace folder" },

    --[[ R = {'<cmd>lua vim.lsp.buf.references()<cr>', "References"}, ]]
    --[[ k = {'<cmd>lua vim.lsp.buf.signature_help()<cr>', "Signature help"}, ]]
    --[[ h = {'<cmd>lua vim.lsp.buf.hover()<cr>', "Hover"}, ]]
    --[[ t = {'<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type definition"}, ]]
    --[[ d = {'<cmd>lua vim.lsp.buf.definition()<cr>', "Go to definition"}, ]]
    --[[ D = {'<cmd>lua vim.lsp.buf.delaration()<cr>', "Go to declaration"}, ]]
  },

  s = {
    name = "Find with Telescope",
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    b = { "<cmd>Telescope builtin<cr>", "Telescope builtin" },
    d = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics" },
    D = { "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", "Line Diagnostics" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    --[[ i = { "<cmd>Telescope media_files<cr>", "Media Files" }, ]]
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    p = { "<cmd>Telescope projects<cr>", "Project" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },

    m = { "<cmd>Telescope marks<cr>", "Marks" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    f = { "<cmd>Telescope lsp_references<cr>", "Find References" },
  },

  o = {
    name = "Options",
    s = { "<cmd>lua vim.o.spell = not vim.o.spell<cr>", "Toggle spell check" },
    z = { "<cmd>ZenMode<cr>", "ZenMode" },
    p = { "<cmd>!chmod +x %<cr>", "Chmod +x" },
    m = { "<cmd>set showmode!<cr>", "Show-mode in statusline" },
    y = { ":%y+ <cr>", "Copy whole file" },
    v = { "<cmd>VimBeGood<cr>", "Vim practice" },
    c = { "<cmd>CccPick<cr>", "Color pick" },
    C = { "<cmd>CccConvert<cr>", "Change color format" },
    r = { "<cmd>CccHighlighterToggle<cr>", "Color enable" },
  },

  p = {
    name = "Packer",
    c = {":PackerCompile<cr>", "Compile Plugins"},
    i = {":PackerInstall<cr>", "Install Plugins"},
    r = {":PackerClean<cr>", "Remove Unused Plugins"},
    s = {":PackerSync<cr>", "Sync Plugins"},
    S = {":PackerStatus<cr>", "Packer Status"},
    u = {":PackerUpdate<cr>", "Update Plugins"}
  },

  B = {
    name = "Buffer",
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to left" },
    l = { "<cmd>BufferLineCloseRight<cr>", "Close all to right" },
    p = { "<cmd>BufferLineTogglePin<cr>", "Toggle pin" },
    --[[ j = { "<cmd>BufferLinePick<cr>", "Jump" }, ]]
  },

  d = {
    name = "Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    u = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },

    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last Run"},
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      },

  t = {
    name = "Terminal",
    h = { "<cmd>ToggleTerm size=14 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
  },

  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
