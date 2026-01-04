return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					local jdtls = require("jdtls")

					-- atalhos
					local on_attach = function(_, buffer)
						local opts = { buffer = buffer }
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- ir para definição
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- ir para declaração
						vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- ir para implementação
						vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- encontrar referências
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- documentação/hover
						vim.keymap.set("n", "<leader>di", jdtls.organize_imports, opts)
						vim.keymap.set("n", "<leader>dt", jdtls.test_class, opts)
						vim.keymap.set("n", "<leader>dn", jdtls.test_nearest_method, opts)
						vim.keymap.set("v", "<leader>de", function()
							jdtls.extract_variable(true)
						end, opts)
						vim.keymap.set("n", "<leader>de", jdtls.extract_variable, opts)
						vim.keymap.set("v", "<leader>dm", function()
							jdtls.extract_method(true)
						end, opts)
					end

					local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
					local workspace_dir = "/home/dani/development/jdtls_data/" .. project_name

					local config = {
						cmd = {
							"java",
							"-javaagent:/home/dani/.local/share/nvim/mason/packages/jdtls/lombok.jar",
							"-Declipse.application=org.eclipse.jdt.ls.core.id1",
							"-Dosgi.bundles.defaultStartLevel=4",
							"-Declipse.product=org.eclipse.jdt.ls.core.product",
							"-Dlog.protocol=true",
							"-Dlog.level=ALL",
							"-Xms1g",
							"--add-modules=ALL-SYSTEM",
							"--add-opens",
							"java.base/java.util=ALL-UNNAMED",
							"--add-opens",
							"java.base/java.lang=ALL-UNNAMED",
							"-jar",
							vim.fn.glob(
								"/home/dani/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
							),
							"-configuration",
							"/home/dani/.local/share/nvim/mason/packages/jdtls/config_linux",
							"-data",
							workspace_dir,
						},
						root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
						on_attach = on_attach,
					}

					jdtls.start_or_attach(config)
				end,
			})
		end,
	},
}
