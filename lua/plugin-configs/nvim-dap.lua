require("nvim-dap-virtual-text").setup {}

vim.cmd [[
	nnoremap <silent> <leader>ddso :lua require"dap".step_over()<CR>
	nnoremap <silent> <leader>ddsi :lua require"dap".step_into()<CR>
	nnoremap <silent> <leader>ddso :lua require"dap".step_out()<CR>
	nnoremap <silent> <leader>ddbp :lua require"dap".toggle_breakpoint()<CR>
	nnoremap <silent> <leader>ddbpc :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
]]
