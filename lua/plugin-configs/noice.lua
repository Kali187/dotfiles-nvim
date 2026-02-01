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
		bottom_search = false, -- use a classic bottom cmdline for search
		inc_rename = true,   -- enables an input dialog for inc-rename.nvim


		command_palette = {
			views = {
				cmdline_popup = {
					border = {
						padding = { 1, 1 },
						color = { bg = "Normal", fg = "Normal" },
					},
					position = {
						row = "100%",
					},
					size = {
						width = "99%",
						height = "auto",
					},
				},
				cmdline_popupmenu = {
					border = {
						style = "rounded",
					},
					position = {
						row = "99%",
						col = "0%",
					},
				},
			},
		},
	},
	long_message_to_split = true, -- long messages will be sent to a split
	inc_rename = true,           -- enables an input dialog for inc-rename.nvim
	lsp_doc_border = true,       -- add a border to hover docs and signature help
}
