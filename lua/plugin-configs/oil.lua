require("oil").setup({
	default_file_explorer = true,
	columns = {
		"icon",
	},
	win_options = {
		signcolumn = "yes:2",
	},
	delete_to_trash = false,
	symlink_destination = true,
	float = {
		-- Padding around the floating window
		padding = 2,
		-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		max_width = 0.6,
		max_height = 0.6,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
		-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
		get_win_title = nil,
		-- preview_split: Split direction: "auto", "left", "right", "above", "below".
		preview_split = "auto",
		-- This is the config that will be passed to nvim_open_win.
		-- Change values here to customize the layout
		override = function(conf)
			return conf
		end,
	},
})
