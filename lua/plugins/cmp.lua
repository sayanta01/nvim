return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	keys = { ":", "/", "?" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup.cmdline({ "/", "?" }, {
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
			Text = "",
			Method = "",
			Function = "ƒ",
			Constructor = "",
			Field = "",
			Variable = "",
			Class = "",
			Interface = "",
			Module = "󱒌",
			Property = "󰓹",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "П",
			Struct = "",
			Event = "",
			Operator = "±",
			TypeParameter = "",
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,

				-- jump to next jumpable
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback) -- jump to previous jumpable
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "spell" },
				{ name = "crates" },
				{
					name = "codeium",
					priority = 100,
				},
			},

			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
					local custom_menu_icon = {
						codeium = "󰘦 Codeium",
						crates = " Crates",
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
