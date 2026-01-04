local M = {}

function M.setup()
	-- Use vim.lsp.config('server_name', { ... }) para configurar o LSP.
	-- Isso define as configurações personalizadas, que serão mescladas
	-- com as configurações padrão do nvim-lspconfig para 'pyright'.
	vim.lsp.config("pyright", {
		-- O 'cmd' e 'filetypes' são definidos por padrão no nvim-lspconfig
		-- e geralmente não precisam ser especificados, a menos que você
		-- precise de um caminho não-padrão. Removidos para simplificar.

		-- Lógica de root_dir mantida
		root_dir = vim.fs.dirname(vim.fs.find({
			".git",
			"pyproject.toml",
			"setup.py",
			"requirements.txt",
			"setup.cfg",
			"Pipfile",
		}, { upward = true })[1]),

		-- A função on_attach (com seus keymaps) mantida
		on_attach = function(client, bufnr)
			print("Pyright ativo no buffer " .. bufnr)

			local opts = { noremap = true, silent = true, buffer = bufnr }
			local keymap = vim.keymap.set

			keymap("n", "K", vim.lsp.buf.hover, opts)
			keymap("n", "gd", vim.lsp.buf.definition, opts)
			keymap("n", "gD", vim.lsp.buf.declaration, opts)
			keymap("n", "gi", vim.lsp.buf.implementation, opts)
			keymap("n", "gr", vim.lsp.buf.references, opts)
			keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
			keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			keymap("n", "[d", vim.diagnostic.goto_prev, opts)
			keymap("n", "]d", vim.diagnostic.goto_next, opts)
			keymap("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,

		-- A tabela 'settings' mantida
		settings = {
			python = {
				venvPath = vim.fn.getcwd(),
				venv = "venv",
				analysis = {
					typeCheckingMode = "strict",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	})

	-- Nota: Se você precisar ativar explicitamente o servidor (o que geralmente
	-- não é necessário ao abrir um arquivo), você pode usar:
	vim.lsp.enable("pyright")
end

return M
