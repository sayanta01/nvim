return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  event = { "BufReadPost", "VeryLazy" },
  dependencies = {
    "SmiteshP/nvim-navic",
  },
  opts = {
    exclude_filetypes = { "netrw", "toggleterm" },
    show_basename = false,

    kinds = {
      File = "",
      Module = "󱒌",
      Namespace = "",
      Package = "",
      Class = "",
      Method = "",
      Property = "",
      Field = "",
      Constructor = "",
      Enum = "ℰ",
      Interface = "",
      Function = "f",
      Variable = "",
      Constant = "󰏿",
      String = "",
      Number = "󰎠",
      Boolean = "◩",
      Array = "",
      Object = "⦿",
      Key = "🔐",
      Null = "NULL",
      EnumMember = "",
      Struct = "",
      Event = "🗲",
      Operator = "󰆕",
      TypeParameter = "",
    },
  },
}
