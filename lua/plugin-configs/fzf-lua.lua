require("fzf-lua").setup({
	{ "fzf-native", "hide" },
	winopts = {
		title_pos = "left",
	},
	files = {
		previewer = "bat",
		git_icons = true,
find_opts         = [[-type f \! -path '*/.git/*']],
		rg_opts = [[--color=never --hidden --files -g "!.git" -g "!**/node_modules**" ]],
    fd_opts = [[--color=never --hidden --type f --type l --exclude ".git" --exclude "node_modules"]],
	},
})
