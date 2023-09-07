local g = vim.g
local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true -- Autoindent new lines

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
opt.conceallevel = 3 -- hide * markup for bold and italic

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
opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support)
opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
opt.shortmess:append("sI")
opt.whichwrap:append("<,>,[,],h,l")

-- Disable builtin plugins
local disabled_built_ins = {
	--[[ "netrw", ]]
	--[[ "netrwPlugin", ]]
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"tar",
	"tarPlugin",
	"zip",
	"zipPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"spellfile_plugin",
	"rplugin",
	"matchit",
	"rrhelper",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
	"tutor",
  "tohtml",
	--[[ "logipat", ]]
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby",
}

for _, provider in ipairs(default_providers) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
