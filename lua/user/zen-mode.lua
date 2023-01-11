require("zen-mode").setup {
  window = {
    backdrop = 0.95,
    width = 176,
    height = 0.9,
    options = {signcolumn = "no", number = false, cursorline = false}
  },
  plugins = {
    options = {enabled = true, ruler = false, showcmd = false},
    twilight = {enabled = false},
    gitsigns = {enabled = false},
    tmux = {enabled = false}
  },
}
