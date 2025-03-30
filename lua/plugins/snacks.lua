return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- stylua: ignore start
  keys = {
    -- { "<leader>f", function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Find Files" },
    { "<leader>z", function() Snacks.zen.zoom() end },
  },
  opts = {
    bigfile = { notify = false, size = 1.5 * 1024 * 1024 },
    input = { icon = "" },
    picker = { icons = { ui = { live = "" } } },
    image = { doc = { inline = false } },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    Snacks.config.style("zoom_indicator", { text = "zoom 📌" })
  end,
}
