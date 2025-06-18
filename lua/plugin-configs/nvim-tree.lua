local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

require("nvim-tree").setup {
	disable_netrw = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	on_attach = my_on_attach,
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = { ".git/*" },
	},
	filters = {
		custom = { ".git/" },
		exclude = { ".gitignore" },
	},
	view = {
		adaptive_size = false,
		width = 30,
		float = {
			open_win_config = {
				border = "rounded"
			}
		}
	}
}

vim.cmd([[
	hi NvimTreeNormal guibg=#020202,
	hi NvimTreeWinSeparator guibg=none guifg=#cc6666
]])
