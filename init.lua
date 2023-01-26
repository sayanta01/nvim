require("user.options")
require("user.keymaps")
require("user.plugins")

-- Unbreakable
require("user.gitsigns")
require("user.toggleterm")
require("user.colorizer")
require("user.colorscheme")
require("user.zen-mode")
require("user.impatient")
require("user.indentline")
require("user.mason")

require("user.telescope")
require("user.project")
require("user.alpha")

require("user.treesitter")
--[[ require("user.rainbow-bracket") ]]
require("user.comment")

require("user.bufferline")
require("user.autopairs")
require("user.lualine")
require("user.illuminate")

-- Dynamic
require("user.autocommands")
require("user.nvim-tree")
require("user.whichkey")
require("user.cmp")
require("user.lsp")
require("user.dap")

--[[ Comment function for json ]]
vim.cmd("au! BufRead,BufNewFile *.json set filetype=jsonc")
