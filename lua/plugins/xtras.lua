return {
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, mode = { "n" } },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, mode = { "n" } },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.constant.new({ elements = { "let", "const" } }),
          augend.semver.alias.semver,
        },
      })
    end,
  },

  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    event = function()
      if vim.fn.exists("$TMUX") == 1 then
        return "VeryLazy"
      end
    end,
  },
}
