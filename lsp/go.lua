return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_markers = { "go.mod" },
	settings = {
		gopls = {
			hints = {
				enable = true,
			},
		},
	},
}
