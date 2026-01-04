return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Carrega o plugin antes de salvar
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Formatar buffer",
		},
	},
	opts = {
		-- Define os formatadores por linguagem
		formatters_by_ft = {
			lua = { "stylua" },
			java = { "google-java-format" },
			-- Você pode adicionar várias de uma vez
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		-- Configuração para formatar ao salvar
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
