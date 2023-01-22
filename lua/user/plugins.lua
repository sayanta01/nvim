--[[ local status_ok, packer = pcall(require, "packer") ]]
--[[ if not status_ok then ]]
--[[ 	return ]]
--[[ end ]]

-- popup window
--[[ packer.init({ ]]
--[[ 	display = { ]]
--[[ 		open_fn = function() ]]
--[[ 			return require("packer.util").float({ border = "rounded" }) ]]
--[[ 		end, ]]
--[[ 	}, ]]
--[[ }) ]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Dependences
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("kyazdani42/nvim-web-devicons")
	--[[ use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight ]]
	--[[ use("moll/vim-bbye") ]]

	use("lewis6991/gitsigns.nvim")
	use("akinsho/toggleterm.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("uga-rosa/ccc.nvim")
	use("folke/zen-mode.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	--[[ use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) ]]
	use("ahmedkhalf/project.nvim")
	use("goolord/alpha-nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	use("akinsho/bufferline.nvim")
	use("windwp/nvim-autopairs") -- Autopairs, integrates with cmp & treesitter
	use("nvim-lualine/lualine.nvim")
	use("RRethy/vim-illuminate")

	use("folke/which-key.nvim")
	use("kyazdani42/nvim-tree.lua")

	-- Extra
	use("ThePrimeagen/vim-be-good")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Themes
	use({
		"uloco/bluloco.nvim",
		requires = { "rktjmp/lush.nvim" },
	})
	use("morhetz/gruvbox")
	use("rose-pine/neovim")
	use("LunarVim/darkplus.nvim")
	use("LunarVim/onedarker.nvim")
	use("folke/tokyonight.nvim")

	-- Cmp plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-calc")
	use("f3fora/cmp-spell")
	use("hrsh7th/cmp-cmdline")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("VonHeikemen/lsp-zero.nvim")
	--[[ use("onsails/lspkind.nvim") ]]

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("ravenxrz/DAPInstall.nvim")
	use("theHamsta/nvim-dap-virtual-text")
	use("mfussenegger/nvim-dap-python")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
