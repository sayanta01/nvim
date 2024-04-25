return {
  "goolord/alpha-nvim",
  event = function()
    if vim.fn.argc() == 0 then
      return "VimEnter"
    end
  end,
  cmd = "Alpha",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[      ___           ___           ___                                     ___     ]],
      [[     /\  \         /\__\         /\  \          ___                      /\  \    ]],
      [[     \ \  \       / / _/_       /  \  \        /\  \        ___         |  \  \   ]],
      [[      \ \  \     / / /\__\     / /\ \  \       \ \  \      /\__\        | | \  \  ]],
      [[  _____\ \  \   / / / / _/_   / /  \ \  \       \ \  \    / /__/      __| |\ \  \ ]],
      [[ /        \__\ / /_/ / /\__\ / /__/ \ \__\  ___  \ \__\  /  \  \     /    |_\ \__\]],
      [[ \ \--\--\/__/ \ \/ / / /  / \ \  \ / /  / /\  \ | |  |  \/\ \  \__  \ \--\  \/__/]],
      [[  \ \  \        \  /_/ /  /   \ \  / /  /  \ \  \| |  |     \ \/\__\  \ \  \      ]],
      [[   \ \  \        \ \/ /  /     \ \/ /  /    \ \__| |__|      \  /  /   \ \  \     ]],
      [[    \ \__\        \  /  /       \  /  /      \    /__/       / /  /     \ \__\    ]],
      [[     \/__/         \/__/         \/__/        \__/__/        \/__/       \/__/    ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", "New file", ":ene | startinsert <CR>"),
      dashboard.button("b", "Bookmarks", ":Telescope marks<CR>"),
      dashboard.button("r", "Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("h", "Check health", ":checkhealth<CR>"),
      dashboard.button("q", "quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.config)
  end,
}
