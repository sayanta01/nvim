local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- spaces instead of tabs
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
opt.undofile = true
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldtext = ""
opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
opt.spelllang:append("cjk") -- disable spellchecking for asian characters `VIM algorithm does not support it`
opt.shortmess:append "cC"
opt.whichwrap:append("<>[]hl")
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.markdown_recommended_style = 0

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
