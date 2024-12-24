local ts = require "telescope"
ts.load_extension "dap"
ts.load_extension "undo"

ts.setup {
	pickers = {
		find_files = {
			theme = "dropdown",
		},
	},
	extensions = {
		undo = {
			-- telescope-undo.nvim config, see below
			use_delta = true,
			use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
			side_by_side = true,
			layout_strategy = "vertical",
			layout_config = {
				preview_height = 0.8,
			},
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
	},
	dap = {},
}
