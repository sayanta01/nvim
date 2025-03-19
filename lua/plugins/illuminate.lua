return {
	"RRethy/vim-illuminate",
	event = { "InsertEnter", "BufWritePost" }, -- LspAttach
	config = function()
		require("illuminate").configure({
			providers = { "lsp", "treesitter", "regex" }, -- used to get references in the buffer, ordered by priority
			delay = 200,
      -- stylua: ignore
      keys = {
        { "A-n", function() require("illuminate").goto_next_reference() end, desc = "Next Reference" },
        { "A-p", function() require("illuminate").goto_prev_reference() end, desc = "Prev Reference" },
      },
			large_file_cutoff = 2000,
			min_count_to_highlight = 2,
		})
	end,
}
