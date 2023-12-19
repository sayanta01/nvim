local opt = vim.opt
-- local g = vim.g

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
-- opt.smartindent = true -- Autoindent new lines

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Info
opt.showmode = false
opt.showcmd = false

-- Clipboard
opt.clipboard = "unnamedplus"

-- Turn off swapfile
opt.swapfile = false

opt.confirm = true
opt.cursorline = true
opt.scrolloff = 6
opt.sidescrolloff = 8
opt.termguicolors = true
opt.signcolumn = "yes"

-- Misc
opt.fileencoding = "utf-8"
opt.writebackup = false -- Disable making a backup before overwriting a file
opt.backup = false -- Creates a backup file
-- opt.hidden = true -- Required to keep multiple buffers and open multiple buffers
opt.undofile = true
opt.updatetime = 180 -- interval for writing swap file to disk, also used by gitsigns
opt.completeopt = "menu,menuone,noselect"

-- Folding using treesitter
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Disable nvim intro
opt.spelllang:append("cjk") -- Disable spellchecking for asian characters (VIM algorithm does not support it)
opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,],h,l")

-- Disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
