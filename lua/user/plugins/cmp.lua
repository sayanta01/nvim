return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = { "InsertEnter", "CmdLineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-calc",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},

	config = function()
		local cmp = require("cmp")

		local snip_status_ok, luasnip = pcall(require, "luasnip")
		if not snip_status_ok then
			return
		end

		-- load snippets from plugins
		require("luasnip/loaders/from_vscode").lazy_load()

		-- cmdline setup
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local kind_icons = {
			Text = "",
			Method = "",
			Function = "f",
			Constructor = "",
			Field = "",
			Variable = "",
			Class = "",
			Interface = "",
			Module = "󱒌",
			Property = "",
			Unit = "",
			Value = "󰎠",
			Enum = "ℰ",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "🗲",
			Operator = "󰆕",
			TypeParameter = "",
		}

		cmp.setup({
			snippet = {
				-- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For Luasnip
				end,
			},

			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			-- Mapping
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(), -- prev suggestion
				["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item, Set `select` to `false` to only confirm explicitly selected items
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,

				-- jump to next jumpable in a snippet
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback) -- jump to previous jumpable in a snippet
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			-- Sources for completion
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
        { name = "buffer" },
				{ name = "path" },
				{ name = "spell" },
				{ name = "calc" },
				{ name = "crates" },
				{
					name = "codeium",
					priority = 100,
				},
			},

			-- Formatting
			formatting = {
				-- fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
					-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind], vim_item.kind)
					-- vim_item.menu = ({
					-- 	codeium = "[Codeium]",
					-- 	nvim_lsp = "[LSP]",
					-- 	luasnip = "[Snip]",
					-- 	buffer = "[Buf]",
					-- 	path = "[Path]",
					-- 	spell = "[Spell]",
					-- 	crates = "[Crates]",
					-- })[entry.source.name]

					-- Custom icons for source
					local custom_menu_icon = {
						codeium = "󱙺 Codeium",
						crates = " Crates",
						-- codeium = "󱙺",
						-- crates = "",
					}
					if entry.source.name == "codeium" then
						vim_item.kind = custom_menu_icon.codeium
					end
					if entry.source.name == "crates" then
						vim_item.kind = custom_menu_icon.crates
					end
					return vim_item
				end,
			},

			experimental = {
				ghost_text = false,
			},
		})
	end,
}
