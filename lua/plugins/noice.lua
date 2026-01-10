return {
	"folke/noice.nvim",
	event = "VeryLazy",
	-- enabled = false,
	opts = {
		-- Adicione suas configurações aqui
		lsp = {
			-- Sobrescreve a documentação e assinatura do LSP padrão pelo Noice
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true, -- usa uma barra de busca na parte inferior
			command_palette = false, -- posiciona a linha de comando no centro
			long_message_to_split = true, -- mensagens longas vão para um split
			inc_rename = false, -- habilita interface para o inc-rename.nvim
			lsp_doc_border = true, -- adiciona borda para documentação do LSP
		},
		routes = {
			{
				filter = { event = "notify", find = "No information available" },
				opts = { skip = true },
			},
		},
	},
	dependencies = {
		-- Obrigatório: para criar os elementos visuais
		"MunifTanjim/nui.nvim",
		-- Opcional: para notificações bonitas (altamente recomendado)
		"rcarriga/nvim-notify",
	},
}
