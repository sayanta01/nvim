return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = {
        notify = false,
        size = 1.5 * 1024 * 1024,
      },
      input = { icon = " " },
      image = {
        doc = {
          inline = false,
          float = true,
        },
      },
    },
  },
}
