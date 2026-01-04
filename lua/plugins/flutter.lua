return {
	"akinsho/flutter-tools.nvim",
	-- ➡️ Alteração Crucial: Carrega apenas quando o tipo de arquivo é 'dart'
	ft = "dart",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		-- Mapeamentos comuns para flutter-tools
		vim.keymap.set("n", "<leader>fr", ":FlutterRun<CR>", { desc = "Flutter: Run App" })
		vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>", { desc = "Flutter: Quit App" })
		vim.keymap.set("n", "<leader>fh", ":FlutterHotReload<CR>", { desc = "Flutter: Hot Reload" })
		vim.keymap.set("n", "<leader>fR", ":FlutterHotRestart<CR>", { desc = "Flutter: Hot Restart" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Actions (Wrap, etc.)" })
		require("flutter-tools").setup({
			ui = {
				border = "rounded",
			},
			dev_tools = {
				autostart = true,
				auto_open_browser = true,
			},
			lsp = {
				color = {
					enabled = false,
				},
				document_color = false,
				flags = {
					allow_incremental_sync = false,
				},
			},
			widget_guides = {
				enabled = true,
			},
			-- Configuração para logs:
			log_mode = {
				-- Habilita o modo de logs (geralmente é true por padrão, mas bom garantir)
				enabled = true,
				-- Define como o buffer de logs deve ser aberto:
				-- 'vsplit': Abre o log em uma divisão vertical à direita (log fica na lateral)
				-- 'split': Abre o log em uma divisão horizontal abaixo (log fica na parte inferior)
				-- 'tab': Abre o log em uma nova aba
				opening_strategy = "vsplit",

				-- Mantém a janela de logs focada nos logs mais recentes (recomendado)
				auto_scroll = true,
			},
			-- ...outras configurações
		})
	end,
}
