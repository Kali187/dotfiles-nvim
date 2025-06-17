return {
	cmd = { 'prettier', '--config', '.prettierrc.json' },
	root_markers = { 'prettierrc.json', 'prettier.config.js' },
	filetypes = { 'javascript', 'typescript', 'html', 'css' },
	single_file = true,
	-- Optional: Enable support for more advanced features
	--     // See prettier documentation for available options
}
