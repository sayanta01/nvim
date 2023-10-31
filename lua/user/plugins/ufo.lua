return {
	"kevinhwang91/nvim-ufo",
	--[[ event = { "VeryLazy", "LspAttach" }, ]]
	event = "BufRead",
	cmd = { "UfoAttach" },
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:]]
		vim.o.foldmethod = "manual"
		vim.o.foldnestmax = 10
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local ufo = require("ufo")
		if not ufo then
			return
		end

		local ftMap = {
			-- option: lsp treesitter indent ""
			vim = "indent",
			python = { "indent" },
			git = function(bufnr)
				local res = {}
				local fileStart, hunkStart
				local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)
				for i, line in ipairs(lines) do
					if line:match("^diff %-%-") then
						if hunkStart then
							table.insert(res, { startLine = hunkStart - 1, endLine = i - 2 })
						end
						if fileStart then
							table.insert(res, { startLine = fileStart - 1, endLine = i - 2 })
						end
						hunkStart, fileStart = nil, nil
					elseif line:match("^@@ %-%d+,%d+ %+%d+,%d+") then
						if hunkStart then
							table.insert(res, { startLine = hunkStart - 1, endLine = i - 2 })
						end
						hunkStart = i
					elseif line:match("^%-%-%- %S") then
						fileStart = i
					end
				end
				if hunkStart then
					table.insert(res, { startLine = hunkStart - 1, endLine = #lines - 2 })
				end
				if fileStart then
					table.insert(res, { startLine = fileStart - 1, endLine = #lines - 2 })
				end
				return res
			end,
		}

		local function customizeSelector(bufnr)
			local function handleFallbackException(err, providerName)
				if type(err) == "string" and err:match("UfoFallbackException") then
					return ufo.getFolds(providerName, bufnr)
				else
					return require("promise").reject(err)
				end
			end

			return ufo.getFolds("lsp", bufnr)
				:catch(function(err)
					return handleFallbackException(err, "treesitter")
				end)
				:catch(function(err)
					return handleFallbackException(err, "indent")
				end)
		end

		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = ("  %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		ufo.setup({
			fold_virt_text_handler = handler,
			open_fold_hl_timeout = 140,
			close_fold_kinds = { "imports", "comment" },
			preview = {
				win_config = {
					border = "single",
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					--[[ jumpTop = "[", ]]
					--[[ jumpBot = "]", ]]
					--[[ switch = "K", ]]
				},
			},
			---@diagnostic disable-next-line: unused-local
			provider_selector = function(bufnr, filetype, buftype)
				return ftMap[filetype] or customizeSelector
			end,
		})

		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
		vim.keymap.set("n", "K", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end)
	end,
}

--[[ return { ]]
--[[ 	"kevinhwang91/nvim-ufo", ]]
--[[ 	dependencies = { "kevinhwang91/promise-async" }, ]]
--[[ 	event = "BufRead", ]]
--[[ 	opts = {}, ]]
--[[ 	config = function() ]]
--[[ 		local capabilities = vim.lsp.protocol.make_client_capabilities() ]]
--[[ 		capabilities.textDocument.foldingRange = { ]]
--[[ 			dynamicRegistration = false, ]]
--[[ 			lineFoldingOnly = true, ]]
--[[ 		} ]]
--	vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:]]
--[[ 		vim.o.foldmethod = "manual" ]]
--[[ 		vim.o.foldnestmax = 10 ]]
--[[ 		vim.o.foldcolumn = "1" -- '0' is not bad ]]
--[[ 		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value ]]
--[[ 		vim.o.foldlevelstart = 99 ]]
--[[ 		vim.o.foldenable = true ]]
--[[ 		require("ufo").setup({ ]]
--[[ 			provider_selector = function() ]]
--[[ 				return { "treesitter", "indent" } ]]
--[[ 			end, ]]
--[[ 		}) ]]
--[[ 	end, ]]
--[[ 	init = function() ]]
--[[ 		vim.keymap.set("n", "zR", function() ]]
--[[ 			require("ufo").openAllFolds() ]]
--[[ 		end) ]]
--[[ 		vim.keymap.set("n", "zM", function() ]]
--[[ 			require("ufo").closeAllFolds() ]]
--[[ 		end) ]]
--[[ 	end, ]]
--[[ } ]]