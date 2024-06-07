local opt = vim.opt

-- opt.number = true
-- opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.clipboard = "unnamedplus"
opt.swapfile = false

opt.wrap = false
opt.showmode = false
opt.showcmd = false
opt.confirm = true
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

opt.smartindent = true -- autoindent new line
opt.cursorline = true
opt.scrolloff = 6
opt.sidescrolloff = 8

opt.fileencoding = "utf-8"
opt.backup = false
opt.writebackup = false -- disable making a backup before overwriting a file
opt.undofile = true
opt.updatetime = 200 -- interval for writing swap file to disk, also used by gitsigns
opt.completeopt = { "menu", "menuone", "noselect" }

opt.foldlevel = 99
opt.foldmethod = "indent"
vim.opt.termguicolors = true

opt.spelllang:append("cjk") -- Disable spellchecking for asian characters `VIM algorithm does not support it`
opt.shortmess:append("c") -- Don't show redundant messages from ins-completion-menu
opt.whichwrap:append("<,>,[,],h,l")

-- Disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
