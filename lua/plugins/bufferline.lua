return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Próximo buffer" })
		vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Buffer anterior" })

		require("bufferline").setup({
			options = {
				mode = "buffers", -- ou "tabs"
				diagnostics = "nvim_lsp",
				separator_style = "slant", -- opções: "slant", "thick", "thin"
				show_buffer_close_icons = false,
				show_close_icon = false,

				offsets = {
					{
						filetype = "neo-tree",
						highlight = "Directory",
						text = "File Explorer",
						text_align = "center",
						separator = false, -- linha separando o bufferline da Neo-tree
						-- padding=0
					},
				},
			},
		})
	end,
}
