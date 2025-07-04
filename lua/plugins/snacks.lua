local function term_nav(dir)
	return function(self)
		return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
			vim.cmd.wincmd(dir)
		end)
	end
end

local function find_root()
	local path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
	local root = vim.fs.find({ ".git", "package.json" }, { path = path, upward = true })[1]
	return vim.fs.dirname(root or path)
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
  -- stylua: ignore start
  keys = {
    { "<leader>f",  function() Snacks.picker.files({ cwd = find_root() }) end,           desc = "Find Files" },
    { "<leader>F",  function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end },
    { "<leader>sg", function() Snacks.picker.grep({ cwd = find_root() }) end,            desc = "Grep" },
    { "<leader>sG", function() Snacks.picker.grep() end },
    { "<leader>sw", function() Snacks.picker.grep({ cwd = find_root() }) end,            desc = "Grep Word",       mode = { "n", "x" } },
    { "<leader>sW", function() Snacks.picker.grep_word() end,                            mode = { "n", "x" } },
    { "<leader>gl", function() Snacks.picker.git_log() end,                              desc = "Log (cwd)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,                         desc = "Current File Log" },
    { "<C-/>",      function() Snacks.terminal() end,                                    desc = "Toggle Terminal" },
    { "<C-_>",      function() Snacks.terminal() end,                                    desc = "which_key_ignore" },
  },
  opts = {
    bigfile = { notify = false },
    image = { doc = { inline = false } },
    input = { icon = "✎" },
    terminal = {
      win = {
        keys = {
          nav_h = { "<C-h>", term_nav("h"), expr = true, mode = "t" },
          nav_j = { "<C-j>", term_nav("j"), expr = true, mode = "t" },
          nav_k = { "<C-k>", term_nav("k"), expr = true, mode = "t" },
          nav_l = { "<C-l>", term_nav("l"), expr = true, mode = "t" },
        },
      },
    },
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
          Variable    = "",
        },
      }
    },
  },
}
