return {

	-- Autocomplete de pares
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},

	-- Parser (Syntax-highligthing + identação)
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "java", "python" },
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_enable = {
				exclude = {
					"jdtls",
				},
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Tela inicial do NeoVim

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local fb = require("telescope").extensions.file_browser

			telescope.load_extension("file_browser")

			-- Atalho para abrir navegador de arquivos no diretório atual
			-- vim.keymap.set("n", "<leader>fb", function()
			--   fb.file_browser({
			--     path = "%:p:h", -- abre no diretório do arquivo atual
			--     respect_gitignore = false,
			--     hidden = true,
			--     grouped = true,
			--     previewer = false,
			--     initial_mode = "normal"
			--   })
			-- end, { desc = "Abrir navegador de arquivos" })
			-- Abre o file browser automaticamente quando o Neovim inicia
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					if vim.fn.argc() == 0 then
						vim.schedule(function()
							vim.cmd("Telescope file_browser path=%:p:h select_buffer=true hidden=true grouped=true")
						end)
					end
				end,
			})
		end,
	},
}
