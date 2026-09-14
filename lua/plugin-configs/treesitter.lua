require("nvim-treesitter").setup()

local ensure_installed = {
	"lua",
	"vim",
	"vimdoc",
	"query",
	"rust",
	"typescript",
	"tsx",
	"javascript",
	"python",
	"go",
	"css",
	"json",
	"yaml",
	"html",
	"dockerfile",
	"bash",
	"markdown",
	"markdown_inline",
}

require("nvim-treesitter").install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
	pattern = ensure_installed,
	callback = function()
		-- Highlighting (native, Neovim-provided)
		vim.treesitter.start()

		-- Treesitter-based folding
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"

		-- Treesitter-based indentation (experimental, per nvim-treesitter's own docs)
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
