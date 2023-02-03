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
require("user.lualine")
require("user.icons")
require("user.surround")
require("user.bufferline")
require("user.nvim-tree")

require("user.treesitter")
require("user.comment")
require("user.autopairs")
require("user.illuminate")

require("user.telescope")
require("user.project")
require("user.alpha")

require("user.autocommands")
require("user.saga")
require("user.cmp")

-- Dynamic
require("user.whichkey")
require("user.lsp")
require("user.dap")

--[[ Notify config ]]
vim.notify = require("notify")

--[[ Comment function for json ]]
vim.cmd("au! BufRead,BufNewFile *.json set filetype=jsonc")

--[[ Color highlighter ]]
--[[ vim.cmd("CccHighlighterToggle") ]]

--[[ ufo - fix this ]]
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Feel free to decrease the value
vim.o.foldlevelstart = 99

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

--[[ local capabilities = vim.lsp.protocol.make_client_capabilities() ]]
--[[ capabilities.textDocument.foldingRange = { ]]
--[[ 	dynamicRegistration = false, ]]
--[[ 	lineFoldingOnly = true, ]]
--[[ } ]]
--[[ local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'} ]]
--[[ for _, ls in ipairs(language_servers) do ]]
--[[ 	require("lspconfig")[ls].setup({ ]]
--[[ 		capabilities = capabilities, ]]
--[[ 		-- you can add other fields for setting up lsp server in this table ]]
--[[ 	}) ]]
--[[ end ]]
require("ufo").setup()
