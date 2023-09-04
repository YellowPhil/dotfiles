local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		python = {
			function()
				return {
					exe = "black",
					args = { "-S", "-l 120", "-" },
					stdin = true,
				}
			end,
		},
	},
})

vim.keymap.set("n", "<space>k", ":FormatWrite<cr>")
