return {
	"RRethy/vim-illuminate",
	event = { "InsertEnter", "BufWritePost" },
	config = function()
		require("illuminate").configure({
			providers = { "lsp", "treesitter", "regex" },
			delay = 200,
      -- stylua: ignore
      keys = {
        { "A-n", function() require("illuminate").goto_next_reference() end },
        { "A-p", function() require("illuminate").goto_prev_reference() end },
      },
			large_file_cutoff = 2000,
			min_count_to_highlight = 2,
		})
	end,
}
