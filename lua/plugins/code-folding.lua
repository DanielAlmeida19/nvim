return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		vim.o.foldcolumn = "0" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		-- customização de como os folds aparecem
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local lineCount = endLnum - lnum - 1
			local curWidth = 0

			-- primeira linha completa
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if curWidth + chunkWidth > width then
					chunkText = truncate(chunkText, width - curWidth)
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
				end
				table.insert(newVirtText, { chunkText, chunk[2] })
				curWidth = curWidth + chunkWidth
				if curWidth >= width then
					break
				end
			end

			-- contador de linhas escondidas
			if lineCount > 0 then
				table.insert(newVirtText, { (" > %d lines"):format(lineCount), "Comment" })
			end

			-- linha com "..."
			if lineCount > 1 then
				-- table.insert(newVirtText, { "   ...", "Comment" })
			end

			-- última linha completa do fold (com proteção)
			local ok, lastLineText = pcall(function()
				return vim.api.nvim_buf_get_lines(0, endLnum - 1, endLnum, false)[1]
			end)
			if ok and lastLineText then
				-- table.insert(newVirtText, { lastLineText, "Normal" })
			end

			return newVirtText
		end

		-- Option 2: nvim lsp as LSP client
		-- Tell the server the capability of foldingRange,
		-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
				-- you can add other fields for setting up lsp server in this table
			})
		end
		require("ufo").setup({
			fold_virt_text_handler = handler,
		})
	end,
}
