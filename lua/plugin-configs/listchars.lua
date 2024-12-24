require("nvim-listchars").setup({
	save_state = true,
	listchars = {
		trail = "·",
		eol = "↲",
		tab = "│ ",
		space = "·",
	},
	notifications = true,
	exclude_filetypes = {
		"markdown"
	},
	-- lighten_step = 8,
})
