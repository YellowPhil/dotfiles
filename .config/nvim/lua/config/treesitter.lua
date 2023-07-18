local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print("Error in Treesitter config")
	return
end

configs.setup({
	ensure_installed = {
		"cpp",
		"lua",
		"c",
        "rust",
		"vim",
		"regex",
		"python",
		"make",
		"cmake",
		"llvm",
		"json",
		"dart",
		"comment",
		"bash",
        "html",
        "php",
        "tsx",
        "typescript",
        "javascript",

	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    auto_install = true,
    on_attach = on_attach,
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = {}, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
