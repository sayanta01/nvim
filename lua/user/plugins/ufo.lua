return {
	"kevinhwang91/nvim-ufo", -- fix: highlight while unfold
	cmd = "UfoAttach",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					relculright = false,
					segments = {
						{ text = { builtin.foldfunc, "  " }, click = "v:lua.ScFa" },
						{ text = { "%s" }, click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, "  " }, click = "v:lua.ScLa" },
					},
				})
			end,
		},
	},
	config = function()
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		require("ufo").setup({
			close_fold_kinds = { "imports", "comment" },
			preview = {
				win_config = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-p>",
					scrollD = "<C-n>",
					jumpTop = "[",
					jumpBot = "]",
				},
			},
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
	init = function()
		vim.keymap.set("n", "zR", function()
			require("ufo").openAllFolds()
		end)
		vim.keymap.set("n", "zM", function()
			require("ufo").closeAllFolds()
		end)
		vim.keymap.set("n", "zr", function()
			require("ufo").openFoldsExceptKinds()
		end)
		vim.keymap.set("n", "zm", function()
			require("ufo").closeFoldsWith() -- closeAllFolds == closeFoldsWith(0)
		end)
		vim.keymap.set("n", "zK", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end)
	end,
}
