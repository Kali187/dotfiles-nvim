local mapx = require("mapx").setup()
-- local crates = require('crates')

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gr", vim.lsp.buf.references)


local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
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

-- Harpoon

-- mapx.nnoremap('<leader>hm', '<Cmd>lua require("harpoon.mark").add_file()<CR>', 'Harpoon - Add file', opts)
-- mapx.nnoremap('<leader>ht', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', 'Harpoon - toggle UI', opts)
-- mapx.nnoremap('<leader>h,', '<Cmd>lua require("harpoon.ui").nav_prev()<CR>', 'Harpoon - Navigate to previous', opts)
-- mapx.nnoremap('<leader>h.', '<Cmd>lua require("harpoon.ui").nav_next()<CR>', 'Harpoon - Navigate to next', opts)
--
