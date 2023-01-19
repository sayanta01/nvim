local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

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
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("moll/vim-bbye")
	use("lewis6991/impatient.nvim")

	use("goolord/alpha-nvim")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-autopairs") -- Autopairs, integrates with cmp & treesitter
	use("nvim-lualine/lualine.nvim")
	use("ahmedkhalf/project.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("akinsho/bufferline.nvim")
	use("akinsho/toggleterm.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("folke/which-key.nvim")
	use("ThePrimeagen/vim-be-good")

	-- Themes
	use("morhetz/gruvbox")
	use("rose-pine/neovim")
	use("LunarVim/darkplus.nvim")
	use("LunarVim/onedarker.nvim")
	use("folke/tokyonight.nvim")
	use("p00f/nvim-ts-rainbow")
	use("folke/zen-mode.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("uga-rosa/ccc.nvim")

	-- Cmp plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-calc")
	use "f3fora/cmp-spell"
	use("hrsh7th/cmp-cmdline")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("RRethy/vim-illuminate")
	--[[ use("onsails/lspkind.nvim") ]]

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
	use("ravenxrz/DAPInstall.nvim")
    use("mfussenegger/nvim-dap-python")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
