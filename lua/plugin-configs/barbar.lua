require("barbar").setup {
	animation = true,
	auto_hide = false,
	tabpages = true,

	clickable = true,
	exclude_ft = { "javascript" },
	exclude_name = {},
	focus_on_close = "left",
	hide = { extensions = true, inactive = false },
	highlight_alternate = false,
	highlight_inactive_file_icons = false,
	highlight_visible = true,
	icons = {
		buffer_index = false,
		buffer_number = false,
		button = "",
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = true },
		},
		filetype = {
			custom_colors = true,
			enabled = true,
		},
		modified = { button = "●" },
		pinned = { button = "", filename = true },
		current = { buffer_index = true },
	},
	insert_at_end = true,
	insert_at_start = false,
	sidebar_filetypes = {
		-- NvimTree = true,
		undotree = {
			text = "undotree",
			align = "center", -- *optionally* specify an alignment (either 'left', 'center', or 'right')
		},
		Outline = {
			event = "BufWinLeave",
			text = "symbols-outline",
			align = "right",
		},
	},
	sort = {
		-- tells barbar to ignore case differences while sorting buffers
		ignore_case = true,
	},
}
