local options = {
  showcmd = false,
  showmode = false,
  timeoutlen = 400,
  fileencoding = "utf-8",
  writebackup = false,
  swapfile = false,
  conceallevel = 0,
  hidden = true,
  undofile = true,
  updatetime = 250,
  backup = false,
  cursorline = true,
  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
  completeopt = { "menuone", "noselect" },
  clipboard = "unnamedplus",
  mouse = "a",
  confirm = true,
  splitbelow = true,
  splitright = true,
  signcolumn = "yes",
  smartcase = true,
  ignorecase = true,
  hlsearch = true,
  wrap = false,
  number = true,
  scrolloff = 6,
  sidescrolloff = 8,
  termguicolors = true,
  --showtabline = 2,
  --pumheight = 9,
  --cmdheight = 2,
  spell = true,
  --[[ smartindent = true, ]]
  --[[ copyindent = true,  -- Copy the previous indentation on autoindenting ]]
  --[[ fillchars = { eob = " " },  -- Disable `~` on nonexistent lines ]]
  --[[ preserveindent = true,  -- Preserve indent structure as much as possible ]]
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
vim.opt.spelllang:append "cjk" -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append "sI"  -- disable nvim intro
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-"
vim.opt.fillchars.eob=" "

-- Disable builtin plugins
vim.g.loaded_zip = 1
vim.g.loaded_tar = 1
vim.g.loaded_gzip = 1
vim.g.loaded_netrw = 1
vim.g.loaded_matchit = 1
vim.g.loaded_vimball = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_getscript = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_tutor = 1
vim.g.loaded_optwin = 1
vim.g.loaded_syntax = 1
vim.g.loaded_synmenu = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_compiler = 1
vim.g.loaded_ftplugin = 1
vim.g.loaded_bugreport = 1
vim.g.loaded_node_provider = 1
vim.g.loaded_ruby_provider = 1
vim.g.loaded_perl_provider = 1
vim.g.loaded_python_provider = 1
vim.g.loaded_python3_provider = 1
