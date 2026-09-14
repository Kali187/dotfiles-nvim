require("nvim-treesitter.configs").setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	auto_install = true,
	indent = { enable = true },
	ensure_installed = {
		"rust",
	}
}

