local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- convert tabs to spaces
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.showmode = false
opt.showcmd = false
opt.laststatus = 3
opt.confirm = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 6
opt.sidescrolloff = 8
opt.writebackup = false -- disable making a backup before overwriting a file
opt.undofile = true -- enable persistent undo
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.completeopt = { "menu", "menuone", "noselect" }
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.termguicolors = true
opt.spelllang:append("cjk") -- disable spellchecking for asian characters `VIM algorithm does not support it`
opt.shortmess:append({ c = true, C = true })
opt.whichwrap:append("<,>,[,],h,l")

-- Disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
