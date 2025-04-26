return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- stylua: ignore start
  keys = {
    { "<leader>F",  function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end },
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
    { "<leader>sG", function() Snacks.picker.grep() end },
    { "<leader>sW", function() Snacks.picker.grep_word() end,                            mode = { "n", "x" } },
    { "<leader>gl", function() Snacks.picker.git_log() end,                              desc = "Log" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,                         desc = "File Log" },
    { "<leader>gg", function() Snacks.lazygit() end,                                     desc = "Lazygit" },
    { "<C-/>",      function() Snacks.terminal() end,                                    desc = "Toggle Terminal" },
    { "<C-_>",      function() Snacks.terminal() end,                                    desc = "which_key_ignore" },
  },
  opts = {
    bigfile = { notify = false },
    image = { doc = { inline = false } },
    input = { icon = "✎" },
    indent = {
      indent = { char = "▏" },
      scope = { char = "▏" },
      animate = { enabled = false },
    },
    lazygit = { configure = false },
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
          ignored   = "",
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
