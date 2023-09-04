local fn = vim.fn
local api = vim.api
local keymap = vim.keymap.set

--local utils = require("utils")

local custom_attach = function(client, bufnr)
	-- Mappings.
	local opts = { silent = true, buffer = bufnr }
	keymap("n", "K", ":Lspsaga hover_doc<cr>", opts)
	keymap("n", "go", ":Lspsaga show_line_diagnostics<cr>", opts)
	keymap("n", "gj", ":Lspsaga diagnostic_jump_next<cr>", opts)
	keymap("n", "gk", ":Lspsaga diagnostic_jump_prev<cr>", opts)
	keymap("n", "gr", ":Lspsaga rename<cr>", opts)
	keymap("n", "<C-u>", ":lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", opts)
	keymap("n", "<C-d>", ":lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", opts)
	keymap("n", "sd", "<cmd>Lspsaga preview_definition<CR>", opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

	-- Set some key bindings conditional on server capabilities
    -- if client.resolved_capabilities.document_formatting then
    if client.server_capabilities.document_formatting then
		vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting_sync, opts)
	end
	-- if client.resolved_capabilities.document_range_formatting then
	if client.server_capabilities.document_range_formatting then
		vim.keymap.set("x", "<space>f", vim.lsp.buf.range_formatting, opts)
	end

	-- The blow command will highlight the current variable and its usages in the buffer.
	-- if client.resolved_capabilities.document_highlight then
	if client.server_capabilities.document_highlight then
		vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
	end

	if vim.g.logging_level == "info" then
		local msg = string.format("Language server %s started!", client.name)
		vim.notify(msg, "info", { title = "Nvim-config" })
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")

if vim.fn.executable("pylsp") == 1 then
	lspconfig.pylsp.setup({
		on_attach = custom_attach,
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = { enabled = false },
					flake8 = { enabled = true },
					pylsp_mypy = { enabled = true },
					pyls_isort = { enabled = true },
					-- pylint = { enabled = true, executable = "pylint" },
					-- pyflakes = { enabled = false },
					-- jedi_completion = { fuzzy = true },
				},
			},
		},
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
	})
	if vim.fn.executable("flake8") == 0 then
		print("Flake8 is not installed!")
	end
	if vim.fn.executable("mypy") == 0 then
		print("Mypy is not installed!")
	end
else
	vim.notify("pylsp not found!", "warn", { title = "Nvim-config" })
end

if vim.fn.executable("clangd") then
	lspconfig.clangd.setup({
		on_attach = custom_attach,
		filetypes = { "c", "cpp", "cc" },
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
	})
else
	vim.notify("clangd not found!", "warn", { title = "Nvim-config" })
end

if vim.fn.executable("gopls") == 1 then
	lspconfig.gopls.setup({
		on_attach = custom_attach,
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
	})
	if vim.fn.executable("flake8") == 0 then
		print("Flake8 is not installed!")
	end
	if vim.fn.executable("mypy") == 0 then
		print("Mypy is not installed!")
	end
else
	vim.notify("gopls not found!", "warn", { title = "Nvim-config" })
end
--
-- if vim.fn.executable("vim-language-server") then
-- 	lspconfig.vimls.setup({
-- 		on_attach = custom_attach,
-- 		flags = {
-- 			debounce_text_changes = 200,
-- 		},
-- 		capabilities = capabilities,
-- 	})
-- else
-- 	vim.notify("vim-language-server not found!", "warn", { title = "Nvim-config" })
-- end
--
-- if vim.fn.executable("bash-language-server") then
-- 	lspconfig.bashls.setup({
-- 		on_attach = custom_attach,
-- 		capabilities = capabilities,
-- 	})
-- else
-- 	vim.notify("bash-language-server not found!", "warn", { title = "Nvim-config" })
-- end

-- if vim.fn.executable("lua-language-server") then
-- 	lspconfig.sumneko_lua.setup({
-- 		on_attach = custom_attach,
-- 		cmd = { "lua-language-server" },
-- 		settings = {
-- 			Lua = {
-- 				runtime = {
-- 					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 					version = "LuaJIT",
-- 					-- Setup your lua path
-- 					path = runtime_path,
-- 				},
-- 				diagnostics = {
-- 					-- Get the language server to recognize the `vim` global
-- 					globals = { "vim" },
-- 				},
-- 				workspace = {
-- 					-- Make the server aware of Neovim runtime files
-- 					library = api.nvim_get_runtime_file("", true),
-- 				},
-- 				-- Do not send telemetry data containing a randomized but unique identifier
-- 				telemetry = {
-- 					enable = false,
-- 				},
-- 			},
-- 		},
-- 		capabilities = capabilities,
-- 	})
-- else
-- 	vim.notify("lua-language-server not found!", "warn", { title = "Nvim-config" })
-- end
-- 
-- Change diagnostic signs.
fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- global config for diagnostic
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = true,
	severity_sort = true,
})
