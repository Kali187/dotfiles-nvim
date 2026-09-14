-- Keep the RPC socket path short: the default stdpath("run") lives deep under
-- /var/folders/.../T/nvim.<user>/<random>/, which pushes the full socket path
-- (used by fzf-lua's serverstart() at startup) past macOS's ~104-char AF_UNIX
-- limit and makes fzf-lua's config fail to load with "invalid argument".
if not vim.env.XDG_RUNTIME_DIR then
	local run_dir = vim.fn.expand("~/.cache/nvim/run")
	vim.fn.mkdir(run_dir, "p", "0700")
	vim.env.XDG_RUNTIME_DIR = run_dir
end

local options = require "options"
local plugins = require "plugins"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, {
	ui = {
		border = "rounded"
	},

})

require("mason").setup()

-- vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme kanagawa]])

local function setup_lsp()
vim.lsp.config('*', {
  root_markers = { '.git' },
})
	local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
	local lsp_servers = {}

	if vim.fn.isdirectory(lsp_dir) == 1 then
		for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
			if file:match("%.lua$") and file ~= "init.lua" then
				local server_name = file:gsub("%.lua$", "")
				table.insert(lsp_servers, server_name)
			end
		end
	end

	vim.lsp.enable(lsp_servers)
end

setup_lsp()

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			require("snacks").dashboard.open()
		end
	end
})

vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

