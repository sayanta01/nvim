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
		triggers = { { "<leader>", mode = { "n", "v" } } },
		win = { title = false },
		icons = {
			separator = "•",
			group = "",
			mappings = false,
		},
		show_help = false,
		show_keys = false,
    -- stylua: ignore
    spec = {
      { "<leader>q",  ":q!<cr>",                                                           desc = "Quit" },
      { "<leader>x",  ":bdelete<cr>",                                                      desc = "Close Buffer" },

      { "<leader>d",  group = "debug",                                                     mode = { "n", "v" } },
      { "<leader>g",  group = "git",                                                       mode = { "n", "v" } },

      { "<leader>c",  group = "code",                                                      mode = { "n", "v" } },
      { "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>",                                desc = "Code Action" },
      { "<leader>cr", ":lua vim.lsp.buf.rename()<cr>",                                     desc = "Rename" },
      { "<leader>cf", ":lua vim.lsp.buf.format()<CR>",                                     desc = "Format" },
      { "<leader>cd", ":lua vim.diagnostic.open_float()<cr>",                              desc = "Line Diagnostics" },
      { "<leader>cq", ":lua vim.diagnostic.setloclist()<cr>",                              desc = "Quickfix List" },
      -- { "<leader>cw", ":lua vim.lsp.buf.add_workspace_folder()<cr>",                       desc = "Add Workspace Folder" },
      -- { "<leader>cW", ":lua vim.lsp.buf.remove_workspace_folder()<cr>",                    desc = "Remove Workspace Folder" },
      -- { "<leader>cl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Workspace Folder" },

      { "<leader>u",  group = "ui", },
      { "<leader>ul", ":terminal live-server<cr>",                                         desc = "Live Server" },
      { "<leader>us", ":set spell!<cr>",                                                   desc = "Toggle Spell " },
      { "<leader>uw", ":set wrap!<cr>",                                                    desc = "Toggle Wrap" },

      { "<leader>s",  group = "search",                                                    mode = { "n", "x" } },
      { "<leader>sc", function() Snacks.picker.command_history() end,                      desc = "Cmd History" },
      { "<leader>sC", function() Snacks.picker.colorschemes() end,                         desc = "Colors" },
      { "<leader>sm", function() Snacks.picker.marks() end,                                desc = "Marks" },
      { '<leader>s"', function() Snacks.picker.registers() end,                            desc = "Registers" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                          desc = "Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                desc = "Workspace Symbols" },
    },
	},
}
