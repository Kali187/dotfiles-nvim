local cmp = require "cmp"

cmp.setup {
	completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
	experimental = { native_menu = false, ghost_text = false },
	formatting = {
		format = require("lspkind").cmp_format {
			mode = "symbol_text",
			maxwidth = 50,
		},
	},
	mapping = {
		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<Esc>"] = cmp.mapping { i = cmp.mapping.close(), c = cmp.mapping.close() },
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
	},
	sources = {
		{ name = "buffer" },
		{ name = "path" },
		{ name = "dotenv" },
		{ name = "treesitter" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
}
