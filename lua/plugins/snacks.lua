return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
  -- stylua: ignore start
  keys = {
    {
      "<leader>f",
      function()
        local git_dir = vim.fs.find(".git", { upward = true })[1]
        local root = git_dir and vim.fn.fnamemodify(git_dir, ":h") or vim.uv.cwd()
        Snacks.picker.files({ cwd = root })
      end,
      desc = "Find Files"
    },
    {
      "<leader>sg",
      function()
        local git_dir = vim.fs.find(".git", { upward = true })[1]
        local root = git_dir and vim.fn.fnamemodify(git_dir, ":h") or vim.uv.cwd()
        Snacks.picker.grep({ cwd = root })
      end,
      desc = "Grep"
    },
    {
      "<leader>sw",
      function()
        local git_dir = vim.fs.find(".git", { upward = true })[1]
        local root = git_dir and vim.fn.fnamemodify(git_dir, ":h") or vim.uv.cwd()
        Snacks.picker.grep({ cwd = root })
      end,
      desc = "Grep Word",
      mode = { "n", "x" }
    },
    { "<leader>z",  function() Snacks.zen.zoom() end },
    { "<leader>gl", function() Snacks.picker.git_log() end,      desc = "Log" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "File Log" },
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
        files = { dir_open = "", file = "" },
        ui = { live = "" },
        git = {
          enabled   = false,
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
          Boolean     = "",
          Constant    = "П",
          Constructor = " ",
          Enum        = "",
          EnumMember  = "",
          Field       = "",
          Function    = "ƒ",
          Interface   = "",
          Key         = "",
          Method      = "",
          Module      = "󰩦",
          Null        = "",
          Operator    = "",
          Package     = "",
          Reference   = "",
          Snippet     = "",
          String      = "",
          Struct      = "",
          Text        = "",
          Unit        = "",
          Unknown     = "",
          Variable    = "",
        },
      }
    },
  },
}
