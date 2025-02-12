require("mini.ai").setup()
require("mini.align").setup()
require("mini.animate").setup()
require("mini.bracketed").setup()
require("mini.comment").setup()
-- require('mini.completion').setup()
require("mini.cursorword").setup()
require("mini.files").setup()
require("mini.icons").setup()
-- require('mini.indentscope').setup()
require("mini.move").setup {
	mappings = {
		-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
		left = "<leader>mh",
		right = "<leader>ml",
		down = "<leader>mj",
		up = "<leader>mk",
		-- Move current line in Normal mode
		line_left = "<leader>mh",
		line_right = "<leader>ml",
		line_down = "<leader>mj",
		line_up = "<leader>mk",
	},
	-- Options which control moving behavior
	options = {
		-- Automatically reindent selection during linewise vertical move
		reindent_linewise = true,
	},
}
require("mini.operators").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
-- *Something* to "test" *surround*
require("mini.splitjoin").setup()
local hipatterns = require "mini.hipatterns"
hipatterns.setup {
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
}
