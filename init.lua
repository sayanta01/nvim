require("user.settings")
require("user.keymaps")
require("user.autocmd")
require("user.plugins")
vim.cmd([[ colorscheme rose-pine ]])
--[[ vim.notify = require("notify") ]]
require("user.lualine")
require("user.icons")
require("user.treesitter")
require("user.indentline")
require("user.lsp")
require("user.dap") -- do lazy_load
