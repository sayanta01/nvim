require("user.settings")
require("user.keymaps")
require("user.autocmd")
require("user.plugins")
vim.cmd([[ colorscheme lunar ]])
vim.notify = require("notify")
require("user.gitsigns")
require("user.toggleterm")
require("user.mason")
require("user.lualine")
require("user.icons")
require("user.nvim-tree")
--[[ require("user.alpha") ]]
--[[ require("user.treesitter") ]]
--[[ require("user.comment") ]]
--[[ require("user.telescope") ]]
--[[ require("user.cmp") ]]
--[[ require("user.autopairs") ]]
require("user.bufferline")
require("user.surround")
require("user.project")
require("user.indentline")
require("user.illuminate")
--[[ require("user.colorizer") ]]

-- Dynamic
require("user.whichkey")
require("user.lsp")
require("user.saga")
require("user.dap")
