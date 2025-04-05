return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeoutlen = 200
  end,
  opts = {
    preset = "modern",
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,
    triggers = {
      { "<leader>", mode = { "n", "v" } },
    },
    win = {
      no_overlap = false,
      title = false,
    },
    icons = {
      breadcrumb = "»",
      separator = "•",
      group = "",
      mappings = false,
    },
    show_help = false,
    show_keys = false,
    disable = {
      ft = { "TelescopePrompt" },
    },
    -- stylua: ignore
    spec = {
      { "<leader>q",  ":q!<cr>",                                                           desc = "Quit" },
      { "<leader>x",  ":bdelete<cr>",                                                      desc = "Close Buffer" },

      { "<leader>d",  group = "Debug",                                                     mode = { "n", "v" } },
      { "<leader>g",  group = "Git",                                                       mode = { "n", "v" } },
      { "<leader>t",  group = "Terminal" },

      { "<leader>c",  group = "Code",                                                      mode = { "n", "v" } },
      { "<leader>cw", ":lua vim.lsp.buf.add_workspace_folder()<cr>",                       desc = "Add Workspace Folder" },
      { "<leader>cW", ":lua vim.lsp.buf.remove_workspace_folder()<cr>",                    desc = "Remove Workspace Folder" },
      { "<leader>cl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Workspace Folder" },
      { "<leader>cf", ":lua vim.lsp.buf.format()<CR>",                                     desc = "Format" },
      { "<leader>cd", ":lua vim.diagnostic.open_float()<cr>",                              desc = "Line Diagnostics" },
      { "<leader>cq", ":lua vim.diagnostic.setloclist()<cr>",                              desc = "Quickfix" },

      { "<leader>o",  group = "Option", },
      { "<leader>ol", ":terminal live-server<cr>",                                         desc = "Live Server" },
      { "<leader>os", ":set spell!<cr>",                                                   desc = "Toggle Spell " },
      { "<leader>ow", ":set wrap!<cr>",                                                    desc = "Toggle Wrap" },

      { "<leader>s",  group = "Search",                                                    mode = { "n", "x" } },
      { "<leader>sc", function() Snacks.picker.command_history() end,                      desc = "Cmd History" },
      { "<leader>sC", function() Snacks.picker.colorschemes() end,                         desc = "Colors" },
      { "<leader>sg", function() Snacks.picker.grep() end,                                 desc = "Grep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end,                            desc = "Grep Word",              mode = { "n", "x" } },
      { "<leader>sm", function() Snacks.picker.marks() end,                                desc = "Marks" },
      { '<leader>s"', function() Snacks.picker.registers() end,                            desc = "Registers" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                          desc = "LSP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                desc = "LSP Workspace Symbols" },
    },
  },
}
