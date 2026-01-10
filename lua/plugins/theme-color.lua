return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- ou "macchiato", "frappe", "latte"
			transparent_background = false,
			auto_integrations = true,
			integrations = {
				bufferline = true,
				treesitter = true,
				telescope = true,
				neotree = true, -- ✅ integração nativa
				trouble = true,
				snacks = {
					enable = true,
					indent_scope_color = "lavender",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
		vim.opt.number = true
		vim.opt.relativenumber = false
		vim.o.cursorline = true
		vim.o.cursorlineopt = "number"
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#6e738d" }) -- números normais
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b7bdf8", bold = true }) -- número da linha atual
		-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#c6a0f6", bold = true }) -- número da linha atual
	end,
}
