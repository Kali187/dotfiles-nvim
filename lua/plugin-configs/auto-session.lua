require("auto-session").setup {
	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		-- ⚠️ This will only work if Telescope.nvim is installed
		-- The following are already the default values, no need to provide them if these are already the settings you want.
		auto_restore_last_session = false,
		auto_create = function()
			local cmd = 'git rev-parse --is-inside-work-tree'
			return vim.fn.system(cmd) == 'true\n'
		end,
		session_lens = {
			-- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
			load_on_setup = true,
			previewer = false,
			mappings = {
				-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
				delete_session = { "i", "<C-D>" },
				alternate_session = { "i", "<C-S>" },
				copy_session = { "i", "<C-Y>" },
			},
			-- Can also set some Telescope picker options
			theme_conf = {
				border = true,
				layout_config = {
					width = 0.8, -- Can set width and height as percent of window
					height = 0.5,
				},
			},
		},
	},
	args_allow_files_auto_save = function()
		local supported = 0
		local tabpages = vim.api.nvim_list_tabpages()
		for _, tabpage in ipairs(tabpages) do
			local windows = vim.api.nvim_tabpage_list_wins(tabpage)
			for _, window in ipairs(windows) do
				local buffer = vim.api.nvim_win_get_buf(window)
				local file_name = vim.api.nvim_buf_get_name(buffer)
				if vim.fn.filereadable(file_name) ~= 0 then supported = supported + 1 end
			end
		end

		-- If we have 2 or more windows with supported buffers, save the session
		return supported >= 2
	end,
}
