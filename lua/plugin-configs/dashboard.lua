local M = {}

function M.setup()
	local status_ok, alpha = pcall(require, "alpha")
	-- if not status_ok then
	-- 	return
	-- end

	local stats = require("lazy").stats()

	local dashboard = require "alpha.themes.dashboard"

	dashboard.section.header.val = {
		[[ ╔────────────────────────────────────────────────╗ ]],
		[[ │ ░░   ░░  ░░░░░  ░░      ░░  ░░  ░░░░░  ░░░░░░░ │ ]],
		[[ │ ▒▒  ▒▒  ▒▒   ▒▒ ▒▒      ▒▒ ▒▒▒ ▒▒   ▒▒      ▒▒ │ ]],
		[[ │ ▒▒▒▒▒   ▒▒▒▒▒▒▒ ▒▒      ▒▒  ▒▒  ▒▒▒▒▒     ▒▒   │ ]],
		[[ │ ▓▓  ▓▓  ▓▓   ▓▓ ▓▓      ▓▓  ▓▓ ▓▓   ▓▓   ▓▓    │ ]],
		[[ │ ██   ██ ██   ██ ███████ ██  ██  █████    ██    │ ]],
		[[ ╚╦──────────────────────────╦────────────────────╝ ]],
		[[  │   Let's code something   │                      ]],
		[[  ╚──────────────────────────╝                      ]],
		[[            \  ^__^                                 ]],
		[[             \ (oo)\_______                         ]],
		[[               (__)\       )\/\                     ]],
		[[                   ||----w |                        ]],
		[[                   ||     ||                        ]],
	}

	dashboard.section.buttons.val = {
		dashboard.button("p", "  Project Manager", ":ProjectMgr<CR>"),
		dashboard.button("w", "  Saved Sessions", ":SessionSearch<CR>"),
		dashboard.button("s", "  Search", ":Telescope live_grep <CR>"),
		dashboard.button("b", "󰮗  Browse files", ":Telescope file_browser <CR>"),
		dashboard.button("f", "󰮗  Find file", ":Telescope find_files <CR>"),
		dashboard.button("r", "󰮳  Recently used files", ":Telescope oldfiles <CR>"),
		dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
	}

	local function footer()
		-- Number of plugins
		local plugins_text = "v"
				.. vim.version().major
				.. "."
				.. vim.version().minor
				.. "."
				.. vim.version().patch
				.. "  "
				.. stats.count
				.. " plugins"
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
