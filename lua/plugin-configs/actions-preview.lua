local hl = require("actions-preview.highlight")
require("actions-preview").setup {
	-- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
	diff = {
		algorithm = "patience",
		ignore_whitespace = true,
	},
	-- priority list of external command to highlight diff
	-- disabled by defalt, must be set by yourself
	highlight_command = {
		hl.delta("delta --no-gitconfig --side-by-side"),

		function()
			return require("actions-preview.highlight").delta()
		end, },

	-- priority list of preferred backend
	backend = { "telescope", "minipick", "snacks", "nui" },

	-- options related to telescope.nvim
	-- telescope = require("telescope.themes").get_dropdown { winblend = 10 },
	telescope = {
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			width = 0.8,
			height = 0.9,
			prompt_position = "top",
			preview_cutoff = 20,
			preview_height = function(_, _, max_lines)
				return max_lines - 15
			end,
		},
	},
	-- options for nui.nvim components
	nui = {
		-- component direction. "col" or "row"
		dir = "col",
		-- keymap for selection component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu#keymap
		keymap = nil,
		-- options for nui Layout component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/layout
		layout = {
			position = "50%",
			size = {
				width = "60%",
				height = "90%",
			},
			min_width = 40,
			min_height = 10,
			relative = "editor",
		},
		-- options for preview area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
		preview = {
			size = "60%",
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
		},
		-- options for selection area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
		select = {
			size = "40%",
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
		},
	},

}
