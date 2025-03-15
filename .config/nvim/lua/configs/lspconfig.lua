-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local util = require 'lspconfig.util'
local lspconfig = require "lspconfig"
local configs = require 'lspconfig.configs'

---------------------------- list of LSP ---------------------
local servers = { "html", "cssls", "ts_ls",
    "clangd","docker_compose_language_service",
    "jdtls", "pyright", "gopls", "volar", "eslint",
    "phpactor", "solidity", "solidity_ls", "pylsp",
    "rust_analyzer"
    -- "basedpyright", "pylyzer"
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    local config = {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
    config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)

  lspconfig[lsp].setup(config)
end

----------------------------- CUSTOM CONFIGS FOR LSPs -------------------------------------------
--- Disable nvim-lsp 
require('cmp').setup.buffer { enabled = false }


--- The rest
lspconfig.denols.setup {
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonrc"),
}

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}

lspconfig.phpactor.setup{
    root_dir = function() return vim.loop.cwd() end
}

lspconfig.gopls.setup({
    settings = {
        -- gopls = {
        --     gofumpt = true
        -- }
    }
})


local solidity_root_files = {
  'hardhat.config.js',
  'hardhat.config.ts',
  'foundry.toml',
  'remappings.txt',
  'truffle.js',
  'truffle-config.js',
  'ape-config.yaml',
}

configs.solidity = {
  default_config = {
    cmd = {'vscode-solidity-server', '--stdio'},
    filetypes = { 'solidity' },
    root_dir = util.root_pattern(unpack(solidity_root_files)) or util.root_pattern('.git', 'package.json'),
    single_file_support = true,
  },
}
