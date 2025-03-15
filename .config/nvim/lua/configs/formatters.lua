local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  {
    name = "golines",
    args = { "--max-len", "80" },
    filetypes = { "go" }
  },
    {
        name = "golangci-lint",
        args = {"--fast"}
    }
}

