local opt = vim.opt

-- opt.number = true
-- opt.relativenumber = true

-- Tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- use spaces instead of tabs

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true -- autoindent new line

-- Split windows
opt.splitbelow = true
opt.splitright = true

opt.clipboard = "unnamedplus" -- sync with system clipboard

opt.swapfile = false

opt.wrap = false
opt.showmode = false
opt.showcmd = false

opt.confirm = true
opt.cursorline = true
opt.scrolloff = 6
opt.sidescrolloff = 8
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

-- Misc
opt.fileencoding = "utf-8"
opt.backup = false -- creates a backup file
opt.writebackup = false -- disable making a backup before overwriting a file
opt.undofile = true -- enable persistent undo
opt.updatetime = 200 -- interval for writing swap file to disk, also used by gitsigns
opt.completeopt = { "menu", "menuone", "noselect" }

-- Folding
opt.foldlevel = 99
opt.foldmethod = "indent"
-- vim.opt.termguicolors = true


opt.spelllang:append("cjk") -- Disable spellchecking for asian characters (VIM algorithm does not support it)
opt.shortmess:append("c") -- Don't show redundant messages from ins-completion-menu
opt.whichwrap:append("<,>,[,],h,l")

-- Disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
