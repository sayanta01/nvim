require("user.settings")
require("user.keymaps")
require("user.autocmd")
require("user.plugins")
vim.cmd([[ colorscheme rose-pine ]])
--[[ vim.notify = require("notify") ]]
require("user.mason")
require("user.lualine")
require("user.icons")
require("user.treesitter")
require("user.bufferline")
require("user.indentline")

-- Dynamic
require("user.whichkey")
require("user.lsp")
--[[ require("user.saga") ]]
require("user.dap") -- lazy_load this
