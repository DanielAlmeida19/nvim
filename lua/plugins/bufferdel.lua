return {
	"ojroques/nvim-bufdel",
	eneabled = false,
	config = function()
		-- substitui o comportamento padrão do :bd
		vim.keymap.set("n", "<leader>c", ":BufDel<CR>", { desc = "Fechar buffer sem fechar janela" })
	end,
}
