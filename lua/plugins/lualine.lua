return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				-- component_separators = { left = "", right = "" },
				-- section_separators   = { left = "", right = "" },
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			ignore_ft = { "neo-tree" },
			sections = {
				-- lado esquerdo
				lualine_a = { "mode" },
				lualine_b = {
					{
						function()
							return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- nome do projeto
						end,
						icon = "",
					},
					"branch",
					{
						"diff",
						colored = true,
						symbols = { added = "+", modified = "~", removed = "-" },
					},
				},
				lualine_c = {
					{ "filename", path = 0 }, -- só o nome do arquivo, separado
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						colored = true,
						symbols = {
							error = " ",
							warn = " ",
							hint = "󰌵 ",
							info = " ",
						},
					},
				},

				-- lado direito
				lualine_x = {
					"filetype",
					{
						function()
							return vim.loop.os_uname().sysname
						end,
						icon = "",
					},
				},
				lualine_y = { "location" },
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
