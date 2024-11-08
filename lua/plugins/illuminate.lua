return {
	"RRethy/vim-illuminate",
	event = { "InsertEnter", "BufWritePost" }, -- LspAttach
	config = function()
		require("illuminate").configure({
			providers = { -- used to get references in the buffer, ordered by priority
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 200,
      -- stylua: ignore
      keys = {
        { "a-n", function() require("illuminate").goto_next_reference() end, desc = "Next Reference" },
        { "a-p", function() require("illuminate").goto_prev_reference() end, desc = "Prev Reference", },
      },
			filetypes_denylist = {
				"lazy",
				"mason",
				"DressingInput",
				"DressingSelect",
				"TelescopePrompt",
				"toggleterm",
				"dirvish",
				"fugitive",
				"alpha",
				"dashboard",
				"neo-tree",
				"NvimTree",
				"Trouble",
				"Outline",
			},
			large_file_cutoff = 2000,
			min_count_to_highlight = 2,
		})
	end,
}
