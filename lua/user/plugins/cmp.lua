return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-calc",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},

	config = function()
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			return
		end

		local snip_status_ok, luasnip = pcall(require, "luasnip")
		if not snip_status_ok then
			return
		end

		-- load snippets from plugins
		require("luasnip/loaders/from_vscode").lazy_load()

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		-- local check_backspace = function()
		-- 	local col = vim.fn.col(".") - 1
		-- 	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
		-- end

		local kind_icons = {
			Text = "󰭸",
			Method = "",
			Function = "ƒ",
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

      -- UI
			window = {
				completion = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
				},
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
				},
			},

			-- Key mapping
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- show completion suggestions in insert mode
				["<C-y>"] = cmp.config.disable, -- specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping
				["<C-e>"] = cmp.mapping({ -- close completion window
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				-- Accept currently selected item, If none selected, 'select' first item
				-- Set 'select' to 'false' to only confirm explicitly selected items
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then
					-- 		cmp.select_next_item()
					-- 	elseif luasnip.expandable() then
					-- 		luasnip.expand()
					-- 	elseif luasnip.expand_or_jumpable() then
					-- 		luasnip.expand_or_jump()
					-- 	elseif check_backspace() then
					-- 		fallback()
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, { "i", "s" }),

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

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			-- Sources for autocompletion
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "nvim_lua" },
				{ name = "spell" },
				{ name = "calc" },
			},

			-- Formatting
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snip]",
						buffer = "[Buf]",
						path = "[Path]",
						nvim_lua = "[LSP_Lua]",
						spell = "[Spell]",
						calc = "[Calc]",
					})[entry.source.name]

					-- Add custom Icons for source
					-- local custom_menu_icon = {
					-- 	calc = "󰆕",
					-- 	-- [[ you could include other sources here as well ]]
					-- }
					-- if entry.source.name == "calc" then
					-- 	vim_item.menu = custom_menu_icon.calc
					-- end

					return vim_item
				end,
			},

			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},

			experimental = {
				ghost_text = false,
			},
		})
	end,
}
