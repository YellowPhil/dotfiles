require "nvchad.options"
local o = vim.o -- options
local wo = vim.wo -- word options ((i gues...))
local cmd = vim.api.nvim_create_autocmd

o.fileencoding = 'utf-8'
o.number = true

-- line wrapping
o.wrap = true
o.linebreak = true
o.textwidth = 0
o.wrapmargin = 0

o.shiftwidth = 4
o.tabstop = 4

cmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format { async = false }
    end,
})


-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
