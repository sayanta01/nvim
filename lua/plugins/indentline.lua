return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "InsertEnter", "BufWritePost" },
  opts = {
    indent = { char = "▏" },
    scope = { show_start = false },
    exclude = {
      filetypes = {
        "Trouble",
        "lazy",
        "mason",
        "NvimTree",
        "notify",
        "toggleterm",
      },
    },
  },
}
