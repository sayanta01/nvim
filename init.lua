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
require("user.saga")
require("user.lsp")
require("user.dap")

--[[ Notify config ]]
vim.notify = require("notify")

--[[ Comment function for json ]]
vim.cmd("au! BufRead,BufNewFile *.json set filetype=jsonc")

--[[ Color highlighter ]]
--[[ vim.cmd("CccHighlighterToggle") ]]

--[[ require("go").setup() ]]
--[[ local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {}) ]]
--[[ vim.api.nvim_create_autocmd("BufWritePre", { ]]
--[[ 	pattern = "*.go", ]]
--[[ 	callback = function() ]]
--[[ 		require("go.format").goimport() ]]
--[[ 	end, ]]
--[[ 	group = format_sync_grp, ]]
--[[ }) ]]
