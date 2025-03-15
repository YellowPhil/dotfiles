require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local bufnr = vim.api.nvim_get_current_buf()

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({"n", 'x', 'v'}, "<A-h>", ":ZellijNavigateLeft!<CR>")
map({'n','x', 'v'}, "<A-l>", ":ZellijNavigateRight!<CR>")
map({'n','x', 'v'}, "<A-j>", ":ZellijNavigateDown!<CR>")
map({'n','x', 'v'}, "<A-k>", ":ZellijNavigateUp!<CR>")

--------------------------- REMAP "S" to SAVE and not to some nonsence etc.---------------------
-- map({'n', 'x', 'v'}, "s", ":wall<cr>")
map({'n', 'x', 'v'}, "<leader>q", ":wqall<cr>")

--------------------------- panes manipulations ----------------------
map("n", "<A-n>", ":vs<cr>")
map("n", "<A-q>", ":close<cr>")

 ---------------------------------------------------------- RUST STUFF ---------------------------------------
map(
  "n", "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)

map(
    "n", "<C-j>",
    function()
        vim.cmd.RustLsp { 'moveItem',  'down' }
    end,
    { silent = true}
)

map(
    "n", "<C-k>",
    function()
        vim.cmd.RustLsp { 'moveItem',  'up' }
    end,
    { silent = true}
)

-- map(
--   "n", "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
--   function()
--     vim.cmd.RustLsp({'hover', 'actions'})
--   end,
--   { silent = true, buffer = bufnr }
-- )

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr><ESC>")
