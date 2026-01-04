local M = {}

function M.setup()
	vim.lsp.config("clangd", {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--completion-style=detailed",
			"--header-insertion=iwyu",
			"--pch-storage=memory",
		},
	})

	vim.lsp.enable("clangd")
end

return M
