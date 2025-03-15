return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup()
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "mfussenegger/nvim-lint",
        config = function()
            require('lint')
        end,
  },
  {
    'https://github.com/fresh2dev/zellij.vim.git',
    lazy = false,
  },
    {'akinsho/git-conflict.nvim', version = "*", config = true},
    -- {
    --   "mrcjkb/rustaceanvim",
    --       -- version = '^5', -- Recommended
    --       lazy = false, -- This plugin is already lazy
    -- },
    {
      'saghen/blink.cmp',
      dependencies = 'rafamadriz/friendly-snippets',
      version = '*',
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = { preset = 'super-tab' },
        -- cmdline.keymap = {
        --   preset = 'enter',
        --     -- OPTIONAL: sets <CR> to accept the item and run the command immediately
        --     -- use `select_accept_and_enter` to accept the item or the first item if none are selected
        --     ['<CR>'] = { 'accept_and_enter', 'fallback' },
        -- },
        cmdline = {
            enabled = false
        },

        appearance = {
            use_nvim_cmp_as_default = true,
          -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          nerd_font_variant = 'mono'
        },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
      },
      opts_extend = { "sources.default" }
    }
}

