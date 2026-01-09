return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			ignore_ft = { "neo-tree", "trouble" },
			sections = {
				-- lado esquerdo
				lualine_a = { { "mode", icon = " " } },
				lualine_b = {
					{
						"branch",
						on_click = function()
							Snacks.picker.git_branches()
						end,
					},
					{
						"diff",
						colored = true,
						symbols = { added = " ", modified = " ", removed = " " },
						on_click = function()
							Snacks.picker.git_diff()
						end,
					},
				},
				lualine_c = {
					{ "filetype", icon_only = true, padding = { left = 1, right = 0 } },
					{
						"filename",
						path = 0,
						icon_enabled = true,
						on_click = function()
							Snacks.picker.files()
						end,
					}, -- só o nome do arquivo, separado
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
						on_click = function()
							require("trouble").toggle({ mode = "diagnostics", focus = false })
						end,
					},
				},

				-- lado direito
				lualine_x = {
					{ "lsp_status", icons_enabled = false },
				},
				lualine_y = { "progress" },
				lualine_z = { { "location", icon = "" } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				-- lualine_c = { "filename" },
				-- lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
