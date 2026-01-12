return {
	pane_gap = 4,                                                               -- empty columns between vertical panes
	autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence{
	preset = {
		keys = {
			{ key = "e", icon = "", desc = "New File", action = ":enew" },
			{ key = "b", icon = "", desc = "Browse Files", action = ":Telescope file_browser" },
			{ key = "f", icon = "", desc = "Search Files", action = ":Telescope find_files" },
			{ key = "s", icon = "", desc = "Search Text", action = ":Telescope live_grep" },
			{ key = "c", icon = "", desc = "Configuration", action = ":edit $MYVIMRC" },
			{ key = "u", icon = "", desc = "Update Plugins", action = ":Lazy update" },
			{ key = "q", icon = "", desc = "Quit", action = ":qa" },
		},
	},
	sections = {
		{ section = "header" },
		{ section = "keys",    gap = 1,     padding = 1 },
		{ section = "startup", padding = 1, align = "left" },
		function()
			return {
				pane = 2,
				text = [[
██╗  ██╗ █████╗ ██╗     ██╗   ██╗ █████╗ ███████╗
██║ ██╔╝██╔══██╗██║     ██║  ███║██╔══██╗╚════██║
█████╔╝ ███████║██║     ██║  ╚██║╚█████╔╝    ██╔╝
██╔═██╗ ██╔══██║██║     ██║   ██║██╔══██╗   ██╔╝
██║  ██╗██║  ██║███████╗██║   ██║╚█████╔╝   ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝ ╚════╝    ╚═╝
]],
				padding = 1,
				indent = 5,
			}
		end,
		{ pane = 2, section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
		-- { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 3, padding = 1 },
		{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 3, padding = 1 },

	},
}
