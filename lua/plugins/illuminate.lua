return {
	"RRethy/vim-illuminate",
	event = "InsertEnter",
	config = function()
		require("illuminate").configure({
			delay = 200,
			large_file_cutoff = 2000,
			min_count_to_highlight = 2,
      -- stylua: ignore
      keys = {
        { "A-n", function() require("illuminate").goto_next_reference() end },
        { "A-p", function() require("illuminate").goto_prev_reference() end },
      },
		})
	end,
}
