local ts = require "telescope"
ts.load_extension "dap"
ts.load_extension "undo"

ts.setup {
	pickers = {
		find_files = {
			theme = "ivy",
			layout_config = {
				width = 0.8,
			}
		},
		live_grep = {
			theme = "ivy",
		}
	},
	extensions = {
		undo = {
			theme = "ivy",
			use_delta = true,
			use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
			vim_diff_opts = {
				ctxlen = vim.o.scrolloff,
			},
			entry_format = "state #$ID, $STAT, $TIME",
			time_format = "",
			saved_only = false,
		},
		packer = {
			theme = "ivy",
			layout_config = {
				height = 0.66,
				width = 0.66,
			},
		},
		file_browser = {
			theme = "dropdown",
			layout_config = {
				width = 0.6,
				height = 0.6,
				mirror = false,
			},
			display_stat = { date = false, size = true, mode = true },
		},
	},
	dap = {},
}
