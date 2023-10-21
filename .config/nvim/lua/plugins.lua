local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Auto-install packer in case it hasn't been installed.
if fn.empty(fn.glob(install_path)) > 0 then
	vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup({
	function(use)
		-- Staff
		use({ "lewis6991/impatient.nvim", config = [[require('impatient')]] })
		use({ "wbthomason/packer.nvim" })
		use({ "nvim-lua/plenary.nvim" })

		-- LSP
		use({ "neovim/nvim-lspconfig", requires = "hrsh7th/nvim-cmp", config = [[require("config.lsp")]] })
		use({ "kkharji/lspsaga.nvim" })
        -- LSP_RUST
        use 'simrat39/rust-tools.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'mfussenegger/nvim-dap'

		-- Appearance
		use({ "sainnhe/gruvbox-material", config = [[require("config.theme")]] })
		use({ "kyazdani42/nvim-web-devicons", event = "VimEnter" })
		use({ "nvim-lualine/lualine.nvim", config = [[require("config.statusline")]] })
		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
                "nvim-tree/nvim-web-devicons",
            },
            config = [[require("config.nvim-tree")]],
            -- config = function()
            --     require("config.nvim-tree").setup {
            --         on_attach=on_attach
            --     }
            -- end
		})
        use({'nvim-treesitter/nvim-treesitter',
            run = function() require('nvim-treesitter.install').update( { with_sync = true} ) end,
            })
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			requires = "kyazdani42/nvim-web-devicons",
			config = [[require("config.bufferline")]],
		})
		use({ "akinsho/toggleterm.nvim", config = [[require("config.toggleterm")]] })

		-- Editing things
		use({
			"numToStr/Comment.nvim",
			config = [[require("Comment").setup()]],
		})
		use({
			"windwp/nvim-autopairs",
			config = [[require("nvim-autopairs").setup()]],
		})
		use({ "mhartington/formatter.nvim", config = [[require("config.formatter")]] })

		-- Search
		use({
			"nvim-telescope/telescope.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = [[require("config.telescope")]],
		})
        use ({'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'})
  --      use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

		-- Syntax highlighting
--		 use({
--		 	"nvim-treesitter/nvim-treesitter",
--		 	run = require("hooks._install"),
--		 	config = [[require("config.")]],
--             autotag = {
--                 enable = true,
--             }
--		 })

		-- Auto completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				{ "onsails/lspkind-nvim", module = "lspkind" },
				{ "hrsh7th/cmp-buffer", module = "cmp_buffer" },
				{ "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
				{ "hrsh7th/cmp-nvim-lua", module = "cmp_nvim_lua" },
				{ "quangnguyen30192/cmp-nvim-ultisnips", module = "cmp_nvim_ultisnips" },
				{ "honza/vim-snippets", opt = true },
				{
					"SirVer/ultisnips",
					opt = true,
					wants = "vim-snippets",
				},
			},
			event = "InsertEnter",
			wants = "ultisnips",
			config = function()
				require("config.cmp")
			end,
		})

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
})
