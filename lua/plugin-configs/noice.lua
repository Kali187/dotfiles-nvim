require("noice").setup {
	lsp = {
		progress = {
			enabled = true,
			format = "lsp_progress",
			format_done = "lsp_progress_done",
			throttle = 1000 / 60, -- frequency to update lsp progress message
		},
		override = {
			-- override the default lsp markdown formatter with Noice
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- override the lsp markdown formatter with Noice
			["vim.lsp.util.stylize_markdown"] = true,
			-- override cmp documentation with Noice (needs the other options to work)
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = true,
		lsp_doc_border = true,
	},
	cmdline = {
		enabled = true,       -- enables the Noice cmdline UI
		view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
		opts = {
			-- backend = "popup",
			relative = "editor",
			position = {
				row = "45%",
				col = "50%",
			},
			size = {
				height = "auto",
				width = "60%",
			},
			border = {
				style = "rounded",
				padding = { 0, 0 },
			},
			winhighlight = "Normal",
			winblend = 0,
		}, -- global options for the cmdline. See section on views
		format = {
			cmdline = { pattern = "^:", icon = " : 󰜴 ", lang = "vim", title = "Command Line" },
			search_down = { kind = "search", pattern = "^/", icon = "   󰜴 ", lang = "regex", title = "Search Down" },
			search_up = { kind = "search", pattern = "^%?", icon = "   󰜴 ", lang = "regex", title = "Search Up" },
			filter = { pattern = "^:%s*!", icon = " $ 󰜴 ", lang = "bash", title = "Shell Command" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "  󰜴 ", lang = "lua", title = "Lua Command" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = " H? 󰜴", lang = "vim", title = "Help" },
			input = { view = "cmdline_input", icon = "  󰜴", title = "Input" },
		},
	},
	popupmenu = {
		enabled = true, -- enables the Noice popupmenu UI
		backend = "nui", -- backend to use to show regular cmdline completions
		kind_icons = {}, -- set to `false` to disable icons
	},
}
