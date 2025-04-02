return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("nvim-autopairs").setup()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    keys = { "ys", "ds", "cs" },
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "ys",
          normal_cur = "yss", -- entire line
          normal_line = "yS",
          normal_cur_line = "ySS",
          visual = "S",
          visual_line = "gS",
          delete = "ds",
          change = "cs", -- <tag>
          change_line = "cS",
        },
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = true,
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "jsx",
      "tsx",
      "markdown",
      "php",
      "twig",
      "vue",
      "xml",
      "svelte",
      "astro",
    },
  },
}
