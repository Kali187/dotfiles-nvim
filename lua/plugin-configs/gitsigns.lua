require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
		end

		-- Navigation
		-- Deliberately ]h/[h, not gitsigns' suggested ]c/[c — mini.bracketed already
		-- owns ]c/[c for comment-block navigation in this config.
		map("n", "]h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, "Gitsigns: Next Hunk")

		map("n", "[h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, "Gitsigns: Previous Hunk")

		-- Actions
		map("n", "<leader>hs", gitsigns.stage_hunk, "Gitsigns: Stage Hunk")
		map("n", "<leader>hr", gitsigns.reset_hunk, "Gitsigns: Reset Hunk")

		map("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "Gitsigns: Stage Hunk (selection)")

		map("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "Gitsigns: Reset Hunk (selection)")

		map("n", "<leader>hS", gitsigns.stage_buffer, "Gitsigns: Stage Buffer")
		map("n", "<leader>hR", gitsigns.reset_buffer, "Gitsigns: Reset Buffer")
		map("n", "<leader>hp", gitsigns.preview_hunk, "Gitsigns: Preview Hunk")
		map("n", "<leader>hi", gitsigns.preview_hunk_inline, "Gitsigns: Preview Hunk Inline")

		map("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end, "Gitsigns: Blame Line")

		map("n", "<leader>hd", gitsigns.diffthis, "Gitsigns: Diff This")

		map("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end, "Gitsigns: Diff Against ~")

		map("n", "<leader>hQ", function()
			gitsigns.setqflist("all")
		end, "Gitsigns: Hunks To Quickfix (All)")
		map("n", "<leader>hq", gitsigns.setqflist, "Gitsigns: Hunks To Quickfix (Buffer)")

		-- Toggles
		-- Moved off gitsigns' suggested <leader>tb/<leader>tw — <leader>tb already
		-- opens FzfLua buffers in this config. Kept under the same <leader>h prefix
		-- as everything else above instead.
		map("n", "<leader>htb", gitsigns.toggle_current_line_blame, "Gitsigns: Toggle Line Blame")
		map("n", "<leader>htw", gitsigns.toggle_word_diff, "Gitsigns: Toggle Word Diff")

		-- Text object
		map({ "o", "x" }, "ih", gitsigns.select_hunk, "Gitsigns: Select Hunk")
	end,
})
