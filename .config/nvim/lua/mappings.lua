require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({"n", 'x', 'v'}, "<A-h>", ":ZellijNavigateLeft!<CR>")
map({'n','x', 'v'}, "<A-l>", ":ZellijNavigateRight!<CR>")
map({'n','x', 'v'}, "<A-j>", ":ZellijNavigateDown!<CR>")
map({'n','x', 'v'}, "<A-k>", ":ZellijNavigateUp!<CR>")


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
