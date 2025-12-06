return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "helix",
		filter = function(mapping)
			return mapping.desc and mapping.desc ~= ""
		end,
		triggers = {
			{ "<leader>", mode = "nvso" },
			{ "z", mode = { "n", "v" } },
		},
		win = { title = false },
		icons = {
			group = "",
			mappings = false,
		},
		show_help = false,
		show_keys = false,
    -- stylua: ignore
    spec = {
      { "<leader>q",  ":q!<cr>",                                            desc = "Qu!t" },
      { "<leader>x",  function() Snacks.bufdelete() end,                    desc = "Delete Buffer" },

      { "<leader>d",  group = "debug",                                      mode = { "n", "x" } },
      { "<leader>g",  group = "git",                                        mode = { "n", "x" } },

      { "<leader>c",  group = "code",                                       mode = { "n", "x" } },
      { "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>",                 desc = "Code Action" },
      { "<leader>cr", ":lua vim.lsp.buf.rename()<cr>",                      desc = "Rename" },
      { "<leader>cl", ":lua vim.diagnostic.setloclist()<cr>",               desc = "Location List" },
      { "<leader>cq", ":lua vim.diagnostic.setqflist()<cr>",                desc = "Quickfix List" },

      { "<leader>u",  group = "ui", },
      { "<leader>ul", ":terminal live-server<cr>",                          desc = "Live Server" },
      { "<leader>us", ":set spell!<cr>",                                    desc = "Toggle Spell" },
      { "<leader>uw", ":set wrap!<cr>",                                     desc = "Toggle Wrap" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end,          desc = "Colorschemes" },

      { "<leader>s",  group = "search",                                     mode = { "n", "x" } },
      { "<leader>s/", function() Snacks.picker.command_history() end,       desc = "Cmd History" },
      { "<leader>sm", function() Snacks.picker.marks() end,                 desc = "Marks" },
      { "<leader>sM", function() Snacks.picker.man() end },
      { '<leader>s"', function() Snacks.picker.registers() end,             desc = "Registers" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },
    },
	},
}
