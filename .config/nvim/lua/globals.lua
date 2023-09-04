vim.g.logging_level = "info"
vim.g.mapleader = " "
vim.g.loaded_sql_completion = 1

if vim.loop.os_uname().sysname == "Darwin" then
  vim.g.is_mac = true
end

if vim.fn.executable("python") == 1 then
	vim.g.python3_host_prog = vim.fn.exepath("python")
else
	print("Python 3 executable not found!")
end

-- Trigger configuration. Do not use <tab> if you use YouCompleteMe
vim.g.UltiSnipsExpandTrigger = "<C-space>"

-- Do not look for SnipMate snippets
vim.g.UltiSnipsEnableSnipMate = 0

-- Shortcut to jump forward and backward in tabstop positions
vim.g.UltiSnipsJumpForwardTrigger = "<C-space>"
-- vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"

-- " Configuration for custom snippets directory, see
-- " https://jdhao.github.io/2019/04/17/neovim_snippet_s1/ for details.
vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "my_snippets" }
