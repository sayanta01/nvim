return {
  -- {
  -- 	"Exafunction/codeium.nvim",
  -- 	enabled = true,
  -- 	cmd = "Codeium",
  -- 	event = "InsertEnter",
  -- 	build = ":Codeium Auth",
  -- 	config = function()
  -- 		require("codeium").setup()
  -- 		local cmp = require("cmp")
  --
  -- 		local sources = vim.tbl_map(function(source)
  -- 			return { name = source.name }
  -- 		end, cmp.get_config().sources)
  --
  -- 		table.insert(sources, { name = "codeium", priority = 100 })
  -- 		cmp.setup.buffer({ sources = sources })
  -- 	end,
  -- },

  -- {
  -- 	"iamcco/markdown-preview.nvim",
  -- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  -- 	build = function()
  -- 		require("lazy").load({ plugins = { "markdown-preview.nvim" } })
  -- 		vim.fn["mkdp#util#install"]()
  -- 	end,
  -- 	keys = { { "<leader>op", ft = "markdown", ":MarkdownPreviewToggle<CR>", desc = "Markdown Preview" } },
  -- 	config = function()
  -- 		vim.cmd([[do FileType]])
  -- 	end,
  -- },

  -- {
  -- 	"luukvbaal/statuscol.nvim",
  -- 	dependencies = {
  -- 		"kevinhwang91/promise-async",
  -- 	},
  -- 	config = function()
  -- 		local builtin = require("statuscol.builtin")
  -- 		require("statuscol").setup({
  -- 			relculright = true,
  -- 			segments = {
  -- 				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  -- 				{ text = { "%s" }, click = "v:lua.ScSa" },
  -- 				{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
  -- 			},
  -- 		})
  -- 	end,
  -- },

  {
    "folke/flash.nvim",
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Up",   mode = { "n", "v" } },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Down", mode = { "n", "v" } },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },

  {
    "b0o/SchemaStore.nvim",
    version = false,
    lazy = true,
  },

  {
    "christoomey/vim-tmux-navigator",
    event = function()
      if vim.fn.exists("$TMUX") == 1 then
        return "VeryLazy"
      end
    end,
  },
}
