local mapx = require("mapx").setup()

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts) -- Set location list with diagnostics



-- Run format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]] -- Format on save

-- Better window swapping
mapx.nnoremap("<C-h>", "<C-w>h") -- Move to left window
mapx.nnoremap("<C-j>", "<C-w>j") -- Move to lower window
mapx.nnoremap("<C-k>", "<C-w>k") -- Move to upper window
mapx.nnoremap("<C-l>", "<C-w>l") -- Move to right window

-- Some small tooling
mapx.noremap('<leader>ww', '<Cmd>set wrap!<CR>', "Word Wrap Toggle") -- E.g: <leader>yy will yank current line to os clipboard
mapx.nnoremap("<leader>nn", "<Cmd>noh<CR>", "Clear search highlight")

mapx.nnoremap("<leader>dde", "<cmd>lua Snacks.dim.enable()<CR>")

-- Utils
mapx.nnoremap("<leader>P", ":ProjectMgr<Cr>", "Project manager")                                        -- Open project manager.

mapx.nnoremap("<leader>ee", ":Explore<Cr>", "File explorer")                                            -- Open file explorer.
mapx.nnoremap("<leader>te", ":Telescope file_browser<Cr>", "Telescope - File browser")                  -- Telescope File browser
mapx.nnoremap("<leader>tE", ":Telescope file_browser path=%:p:h select_buffer=true<Cr>",
	"Telescope - File browser in current folder")                                                         -- Telescope File browser in current folder
mapx.nnoremap("<leader>tn", ":NoiceTelescope<Cr>", "Telescope - Notifications")                         -- Telescope Notifications
mapx.nnoremap("<leader>t:", ":Telescope commands<Cr>", "Telescope - Commands")                          -- Telescope Commands
mapx.nnoremap("<leader>tm", ":Telescope marks<Cr>", "Telescope - Marks")                                -- Telescope Marks
mapx.nnoremap("<leader>tu", ":Telescope undo<Cr>", "Telescope - Undos")                                 -- Telescope Undos
mapx.nnoremap("<leader>tf", ":Telescope find_files<Cr>", "Telescope - Find files")                      -- Telescope find files
mapx.nnoremap("<leader>tb", ":Telescope buffers<Cr>", "Telescope - Buffers")                            -- Telescope buffers
mapx.nnoremap("<leader>tg", ":Telescope live_grep<Cr>", "Telescope - Grep")                             -- Telescope live grep
mapx.nnoremap("<leader>to", ":Telescope oldfiles<Cr>", "Telescope - Recent Files")                      -- Telescope old files
mapx.nnoremap("<leader>tc", ":Telescope current_buffer_fuzzy_find<Cr>", "Telescope - Search in buffer") -- Telescope current buffer fuzzy find
mapx.nnoremap("<leader>td", ":Telescope diagnostics<Cr>", "Telescope - Diagnostics")                    -- Telescope diagnostics
mapx.nnoremap("<leader>tqq", ":Telescope quickfix<Cr>", "Telescope - Quickfix")                         -- Telescope quickfix
mapx.nnoremap("<leader>tqh", ":Telescope quickfixhistory<Cr>", "Telescope - Quickfix History")          -- Telescope quickfix history
mapx.nnoremap("<leader>tqh", ":Telescope vim_options<Cr>", "Telescope - Vim Options")                   -- Telescope vim options

-- Telescope LSP
mapx.nnoremap("<leader>tlsw", ":Telescope lsp_workspace_symbols<Cr>", "Telescope - LSP Workspace Symbols") -- Telescope LSP workspace symbols
mapx.nnoremap("<leader>tlsd", ":Telescope lsp_document_symbols<Cr>", "Telescope - LSP Document Symbols")   -- Telescope LSP document symbol
mapx.nnoremap("<leader>tltd", ":Telescope lsp_type_definitions<Cr>", "Telescope - LSP Type Definitions")   -- Telescope LSP type definitions

-- LspSaga calls
mapx.nnoremap("<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")                           -- LspSaga incoming calls
mapx.nnoremap("<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")                           -- LspSaga outgoing calls

mapx.nnoremap("<C-A>", "<cmd>LspRestart<CR>")                                            -- Restart LSP
mapx.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Diagnostics - Previous") -- Go to previous diagnostic
mapx.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Diagnostics - Next")     -- Go to next diagnostics
mapx.nnoremap(
	"[c",
	"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
	"Diagnostics - Previous ERROR"
) -- Go to previous ERROR diagnostic
mapx.nnoremap(
	"]c",
	"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
	"Diagnostics - Next ERROR"

)                                                                   -- Go to next ERROR diagnostic

mapx.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")        -- Go to definition
mapx.inoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>") -- Signature help in insert mode
mapx.nnoremap("do", "<cmd>Lspsaga code_action<CR>", "Code Action")  -- LspSaga code action
mapx.nnoremap(
	"se",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	"Line Diagnostics"
) -- Show line diagnostics in a floating window

vim.keymap.set({ "n", "x" }, "ca", function()
	require('actions-preview').code_actions()
end, { noremap = true, silent = true }) -- Actions Preview code actions

vim.keymap.set({ "n", "x" }, "cc", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true }) -- Tiny Code Action code actions

-- Close and pin buffer
mapx.nnoremap("<leader>bcc", "<Cmd>BufferClose<CR>", opts)              -- Close current buffer
mapx.nnoremap("<leader>bc,", "<Cmd>BufferCloseBuffersLeft<CR>", opts)   -- Close buffers to the left
mapx.nnoremap("<leader>bc.", "<Cmd>BufferCloseBuffersRight<CR>", opts)  -- Close buffers to the right
mapx.nnoremap("<leader>bco", "<Cmd>BufferCloseAllButCurrent<CR>", opts) -- Close all but current buffer
mapx.nnoremap("<leader>bv", "<Cmd>BufferPin<CR>", opts)                 -- Pin/unpin buffer
mapx.nnoremap("<leader>br", "<cmd>lua vim.lsp.buf.rename()<CR>")        -- Rename buffer (LSP)

-- Switch to previous next buffer
mapx.nnoremap("<leader>b,", "<Cmd>BufferPrevious<CR>", opts) -- Previous buffer
mapx.nnoremap("<leader>b.", "<Cmd>BufferNext<CR>", opts)     -- Next buffer

-- Re-order to previous/next
mapx.nnoremap("<leader>bm,", "<Cmd>BufferMovePrevious<CR>", opts) -- Move buffer to previous position
mapx.nnoremap("<leader>bm.", "<Cmd>BufferMoveNext<CR>", opts)     -- Move buffer to next position

--
mapx.nnoremap("<leader>wf", "<Cmd>SessionSearch<CR>", opts)         -- Search sessions
mapx.nnoremap("<leader>ws", "<Cmd>SessionSave<CR>", opts)           -- Save session
mapx.nnoremap("<leader>wa", "<Cmd>SessionToggleAutoSave<CR>", opts) -- Toggle autosave session

-- Dashboard
vim.keymap.set({ "n", "x" }, "aa", function()
	require("snacks").dashboard.open()
end, { noremap = true, silent = true }) -- Open Snacks dashboard

-- Neogit
mapx.nnoremap("<leader>ng", "<Cmd>Neogit<CR>", opts) -- Open Neogit

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end
		-- Displays hover information about the symbol under the cursor
		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
		-- Jump to the definition
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
		-- Jump to declaration
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
		-- Lists all the implementations for the symbol under the cursor
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
		-- Jumps to the definition of the type symbol
		bufmap("n", "td", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
		-- Lists all the references
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
		-- Displays a function's signature information
		bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
		-- Renames all references to the symbol under the cursor
		bufmap("n", "gsr", "<cmd>lua vim.lsp.buf.rename()<cr>")
		-- Selects a code action available at the current cursor position
		-- bufmap("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		-- Show diagnostics in a floating window
		bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
		-- Move to the previous diagnostic
		bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
		-- Move to the next diagnostic
		bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})
