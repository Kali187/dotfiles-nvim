local mapx = require("mapx").setup()
-- local crates = require('crates')

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gr", vim.lsp.buf.references)


local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Run format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- Better window swapping
mapx.nnoremap("<C-h>", "<C-w>h")
mapx.nnoremap("<C-j>", "<C-w>j")
mapx.nnoremap("<C-k>", "<C-w>k")
mapx.nnoremap("<C-l>", "<C-w>l")

-- Utils
mapx.nnoremap("<leader>P", ":ProjectMgr<Cr>")                           -- Open project manager.
mapx.nnoremap("<C-e>", ":NvimTreeToggle<Cr>")                           -- Toggle file explorer.
mapx.nnoremap("<C-o>", ":Lspsaga outline<Cr>")                          -- Show symbols outline.
mapx.nnoremap("<leader>tt", ":TroubleToggle<Cr>")                       -- Show workspace issues.

mapx.nnoremap("<leader>td", ":Trouble todo<Cr>")                        -- Show todo comments
mapx.nnoremap("<leader>tu", ":Telescope undo<Cr>")                      -- Display undo tree
mapx.nnoremap("<leader>tf", ":Telescope find_files<Cr>")                -- Find files
mapx.nnoremap("<leader>tb", ":Telescope buffers<Cr>")                   -- Buffers
mapx.nnoremap("<leader>tg", ":Telescope live_grep<Cr>")                 -- search in file
mapx.nnoremap("<leader>to", ":Telescope oldfiles<Cr>")                  -- recent files
mapx.nnoremap("<leader>tc", ":Telescope current_buffer_fuzzy_find<Cr>") -- fuzzy search in buffer

mapx.nnoremap("<M-f>", ":lua MiniFiles.open()<Cr>")                     -- Mini files manager


-- LspSaga calls
mapx.nnoremap("<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
mapx.nnoremap("<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")


mapx.nnoremap("<C-A>", "<cmd>LspRestart<CR>")
mapx.nnoremap("<C-wq>", "<cmd>bd<CR>")
mapx.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
mapx.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
mapx.nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
mapx.nnoremap(
	"[c",
	"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>"
)
mapx.nnoremap(
	"]c",
	"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>"
)

mapx.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
mapx.inoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
mapx.nnoremap("do", "<cmd>Lspsaga code_action<CR>", "Code Action")
mapx.nnoremap(
	"se",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	"Line Diagnostics"
)

mapx.nnoremap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- Close and pin buffer
mapx.nnoremap('<leader>bc', '<Cmd>BufferClose<CR>', opts)
mapx.nnoremap('<leader>bv', '<Cmd>BufferPin<CR>', opts)

-- Switch to previous/next buffer
mapx.nnoremap('<leader>b,', '<Cmd>BufferPrevious<CR>', opts)
mapx.nnoremap('<leader>b.', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
mapx.nnoremap('<leader>bm,', '<Cmd>BufferMovePrevious<CR>', opts)
mapx.nnoremap('<leader>bm.', '<Cmd>BufferMoveNext<CR>', opts)

--
mapx.nnoremap('<leader>wf', '<Cmd>SessionSearch<CR>', opts)
mapx.nnoremap('<leader>ws', '<Cmd>SessionSave<CR>', opts)
mapx.nnoremap('<leader>wa', '<Cmd>SessionToggleAutoSave<CR>', opts)

-- Dashboard
mapx.nnoremap('<leader>aa', '<Cmd>Alpha<CR>', opts)

-- Neogit
mapx.nnoremap('<leader>ng', '<Cmd>Neogit<CR>', opts)


vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end
		-- Displays hover information about the symbol under the cursor
		bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
		-- Jump to the definition
		bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
		-- Jump to declaration
		bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
		-- Lists all the implementations for the symbol under the cursor
		bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
		-- Jumps to the definition of the type symbol
		bufmap('n', 'td', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
		-- Lists all the references
		bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
		-- Displays a function's signature information
		bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
		-- Renames all references to the symbol under the cursor
		bufmap('n', 'gsr', '<cmd>lua vim.lsp.buf.rename()<cr>')
		-- Selects a code action available at the current cursor position
		bufmap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		-- Show diagnostics in a floating window
		bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
		-- Move to the previous diagnostic
		bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
		-- Move to the next diagnostic
		bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
	end
})
