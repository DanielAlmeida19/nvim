vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
-- Ativa a barra de status global
vim.opt.laststatus = 3
require("config/lazy")
require("vim-options")
require("config/lsp")
