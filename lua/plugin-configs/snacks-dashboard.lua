return {
	sections = {
		{ section = "header" },
		{ section = "keys",  gap = 1, padding = 1 },
		function()
			return {
				pane = 2,
				text = [[
██╗  ██╗ █████╗ ██╗     ██╗ ██╗ █████╗ ███████╗
██║ ██╔╝██╔══██╗██║     ██║███║██╔══██╗╚════██║
█████╔╝ ███████║██║     ██║╚██║╚█████╔╝    ██╔╝
██╔═██╗ ██╔══██║██║     ██║ ██║██╔══██╗   ██╔╝
██║  ██╗██║  ██║███████╗██║ ██║╚█████╔╝   ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝ ╚═╝ ╚════╝    ╚═╝
]],
				padding = 1,
				indent = 5,
			}
		end,
		-- { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 3, padding = 1 },
		{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 3, padding = 1 },
		function()
			local in_git = Snacks.git.get_root() ~= nil
			local cmds = {
				{
					icon = " ",
					title = "Git Status",
					cmd = "git --no-pager diff --stat -B -M -C",
					height = 5,
				},
				{
					icon = " ",
					title = "Git Log",
					cmd = "git --no-pager log --oneline --graph --decorate -n 5",
					height = 7,
				},
			}
			return vim.tbl_map(function(cmd)
				return vim.tbl_extend("force", {
					pane = 2,
					section = "terminal",
					enabled = in_git,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				}, cmd)
			end, cmds)
		end,
		{
			pane = 2,
			icon = " ",
			desc = "Browse Repo",
			padding = 1,
			key = "b",
			action = function()
				Snacks.gitbrowse()
			end,
		},

		{ section = "startup", padding = 1, align = "left" },
	},
}
