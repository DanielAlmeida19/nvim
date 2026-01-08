-- Diagnostics
-- Define os ícones para cada severidade
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "󰌵" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, {
		text = sign.text,
		texthl = sign.name,
		numhl = "",
	})
end

-- Configura como os diagnósticos aparecem
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true, -- 🔑 garante sublinhado
	update_in_insert = false,
	severity_sort = true,
})

-- Atalho para abrir a "caixinha" com diagnóstico da linha
vim.keymap.set("n", "<leader>p", function()
	vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
end, { desc = "Mostrar diagnóstico da linha" })

-- Keymaps
vim.keymap.set({ "n", "v" }, "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Menu de Ações de Código (Code Actions)" })
vim.keymap.set("n", "<leader>p", vim.diagnostic.open_float, { desc = "Mostrar erro" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Erro anterior" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Próximo erro" })
local function toggle_diagnostics()
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.loclist == 1 then
			vim.cmd("lclose")
			return
		end
	end
	vim.diagnostic.setloclist()
end

vim.keymap.set("n", "<leader>q", toggle_diagnostics, { desc = "Alternar lista de erros" })

require("config.pyright").setup()
require("config.clang").setup()
