return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- stylua: ignore start
  keys = {
    { "<leader>f",  function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Find Files" },
    { "<leader>z",  function() Snacks.zen.zoom() end },
    { "<leader>gl", function() Snacks.picker.git_log() end,                               desc = "Log" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,                          desc = "File Log" },
  },
  opts = {
    bigfile = { notify = false },
    input = { icon = "" },
    image = { doc = { inline = false } },
    styles = { zoom_indicator = { text = "zoom 📌" } },
    indent = {
      indent = { char = "▏" },
      scope = { char = "▏" },
      animate = { enabled = false },
    },
    picker = {
      icons = {
        files = { dir = "", dir_open = "", file = "" },
        ui = { live = "" },
        git = {
          enabled   = true,
          commit    = " ",
          added     = "⊠",
          modified  = "⊡",
          deleted   = "",
          ignored   = "",
          renamed   = "✎",
          unmerged  = "",
          untracked = "∪",
        },
        kinds = {
          Boolean    = "",
          Constant   = "П",
          Enum       = "",
          EnumMember = "",
          Field      = "",
          Function   = "ƒ",
          Interface  = "",
          Key        = "",
          Module     = "",
          Operator   = "±",
          Package    = "",
          Reference  = "",
          Snippet    = "",
          String     = "",
          Struct     = "",
          Text       = "",
          Unit       = "",
          Unknown    = "",
          Value      = "",
          Variable   = "",
        },
      }
    },
  },
}
