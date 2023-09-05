local g = vim.g
local opt = vim.opt

-- line numbers
opt.number= true
opt.relativenumber= true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
-- autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
-- smartindent = true -- know this

-- split windows
opt.splitright = true
opt.splitbelow = true

-- info
opt.showmode = false
opt.showcmd = false

-- clipboard
opt.clipboard = "unnamedplus"

-- turn off swapfile
opt.swapfile = false

opt.confirm = true
opt.cursorline = true
opt.scrolloff = 6
opt.sidescrolloff = 8
opt.termguicolors = true
opt.conceallevel = 0

-- know this
opt.fileencoding = "utf-8"
opt.signcolumn = "yes"
opt.writebackup = false
opt.backup = false
opt.hidden = true
opt.undofile = true
opt.updatetime = 260
opt.completeopt = { "menuone", "noselect" }

-- Disable nvim intro
opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support it)
opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
opt.shortmess:append "sI"
opt.whichwrap:append("<,>,[,],h,l")

-- Disable builtin plugins
local disabled_built_ins = {
   -- "netrw",
   -- "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "tar",
  "tarPlugin",

  "matchit",
  "matchparen",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  -- "tutor_mode_plugin",
  -- "rplugin",
  -- "synmenu",
  -- "syntax",

  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",

  "remote_plugins",
  "logipat",
  "shada_plugin",
  "lazyredraw",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
 end
