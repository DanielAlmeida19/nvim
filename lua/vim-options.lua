vim.api.nvim_create_autocmd("colorscheme",{
    callback = function ()
        vim.opt.number=true
        vim.opt.relativenumber=true
        vim.opt.termguicolors = true      -- necessário para usar cores hex no terminal

        vim.o.cursorline = true
        vim.o.cursorlineopt = "number"
        vim.opt.signcolumn = "yes"

        vim.api.nvim_set_hl(-1, "CursorLineNr", { fg = "#ffa500", bold = true })
    end
})
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Tenta manter o cursor mais ao centro no scroll
vim.opt.scrolloff = math.floor(vim.o.lines * 0.145)
vim.opt.sidescrolloff = math.floor(vim.o.columns * 0.08)
-- Define o leader como espaço

