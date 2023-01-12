require("zen-mode").setup {
  window = {
    backdrop = 0.95,
    width = 140,
    height = 0.9,
    options = {signcolumn = "no", number = false, cursorline = true}
  },
  plugins = {
    options = {enabled = true, ruler = false, showcmd = false},
    gitsigns = {enabled = false},
    tmux = {enabled = false}
  },
}
