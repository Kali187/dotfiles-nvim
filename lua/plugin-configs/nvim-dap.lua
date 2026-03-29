require("nvim-dap-virtual-text").setup {


}

require('dap').adapters['pwa-node'] = {
	type = 'server',
	host = 'localhost',
	port = '${port}',
	executable = {
		command = 'node',
		-- TODO update with your correct path (when you install it in the next step)
		args = { '/YOUR_PATH/js-debug/src/dapDebugServer.js', '${port}' },
	},
}

local dap = require 'dap'
local js_based_languages = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }
for _, language in ipairs(js_based_languages) do
	dap.configurations[language] = {
		-- ...
		{
			name = 'Next.js: debug server-side',
			type = 'pwa-node',
			request = 'attach',
			port = 9231,
			skipFiles = { '<node_internals>/**', 'node_modules/**' },
			cwd = '${workspaceFolder}',
		},
	}
end

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "$HOME/scripts/vscode-chrome-debug/out/src/chromeDebug.js" } -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}"
	}
}

dap.configurations.typescriptreact = { -- change to typescript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}"
	}
}

vim.cmd [[
	nnoremap <silent> <leader>ddso :lua require"dap".step_over()<CR>
	nnoremap <silent> <leader>ddsi :lua require"dap".step_into()<CR>
	nnoremap <silent> <leader>ddso :lua require"dap".step_out()<CR>
	nnoremap <silent> <leader>ddbp :lua require"dap".toggle_breakpoint()<CR>
	nnoremap <silent> <leader>ddbpc :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
]]
