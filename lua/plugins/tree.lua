return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- ícones bonitinhos
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- fecha se for a última janela
			filesystem = {
				follow_current_file = true, -- sempre destacar o arquivo aberto
				hijack_netrw_behavior = "open_default", -- substituir netrw
			},
			buffers = {
				follow_current_file = true, -- destacar buffer atual
				group_empty_dirs = true,
			},
			git_status = {
				window = { position = "float" }, -- painel flutuante p/ status git
			},
		})

		-- 🛠 Atalhos globais
		vim.keymap.set("n", "<leader>e", ":Neotree<CR>", { desc = "Abrir árvore de arquivos" })
		vim.keymap.set("n", "<leader>b", ":Neotree toggle buffers<CR>", { desc = "Abrir lista de buffers" })
		vim.keymap.set("n", "<leader>g", ":Neotree toggle git_status<CR>", { desc = "Abrir status do Git" })
		vim.keymap.set("n", "<leader>q", ":BufDel<CR>", { desc = "Fechar buffer sem fechar janela" })
	end,
}
