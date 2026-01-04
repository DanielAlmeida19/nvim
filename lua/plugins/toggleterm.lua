return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- enabled = false,
	config = function()
		require("toggleterm").setup({
			direction = "vertical", -- ou "horizontal" / "float"
			size = 64, -- largura (para vertical)
			open_mapping = [[<leader>t]], -- tecla para abrir/fechar
			shade_terminals = false, -- escurece o fundo do terminal
			start_in_insert = true, -- já entra no modo terminal
			persist_size = true, -- mantém tamanho entre aberturas
			winhighlight = "Normal:#181927,NormalNC:#181927",
		})
	end,
}
