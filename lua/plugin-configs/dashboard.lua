local M = {}

function M.setup()
	local status_ok, alpha = pcall(require, "alpha")
	if not status_ok then
		return
	end

	local stats = require("lazy").stats()

	local dashboard = require "alpha.themes.dashboard"

	dashboard.section.header.val = {
		[[ 		╔─────────────────────────────────────────────────────────────╗ ]],
		[[ 		│  888    d8P           888 d8b  d888   .d8888b.  8888888888  │ ]],
		[[ 		│  888   d8P            888 Y8P d8888  d88P  Y88b       d88P  │ ]],
		[[ 		│  888  d8P             888       888  Y88b. d88P      d88P   │ ]],
		[[ 		│  888d88K      8888b.  888 888   888   "Y88888"      d88P    │ ]],
		[[ 		│  8888888b        "88b 888 888   888  .d8P""Y8b.  88888888   │ ]],
		[[ 		│  888  Y88b   .d888888 888 888   888  888    888   d88P      │ ]],
		[[ 		│  888   Y88b  888  888 888 888   888  Y88b  d88P  d88P       │ ]],
		[[ 		│  888    Y88b "Y888888 888 888 8888888 "Y8888P"  d88P        │ ]],
		[[ 		╚─────────────────────────────────────────────────────────────╝ ]],
	}

	dashboard.section.buttons.val = {
		dashboard.button("s", "  Search", ":Telescope live_grep <CR>"),
		dashboard.button("t", "  Toggle term", ":ToggleTerm<CR>"),
		dashboard.button("p", "  Project Manager", ":ProjectMgr<CR>"),
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button(
			"r",
			"  Recently used files",
			":Telescope oldfiles <CR>"
		),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	}

	local function footer()
		-- Number of plugins
		local datetime = os.date "%d-%m-%Y %H:%M:%S"
		local plugins_text = "   "
			.. stats.count
			.. " plugins"
			.. "   v"
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. "   "
			.. datetime

		-- Quote
		local fortune = require "alpha.fortune"
		local quote = table.concat(fortune(), "\n")

		return plugins_text .. "\n" .. quote
	end

	dashboard.section.footer.val = footer()

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true
	alpha.setup(dashboard.opts)
end

return M
