local mapx = require("mapx").setup()
-- local crates = require('crates')

-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
-- vim.keymap.set("n", "gr", vim.lsp.buf.references)

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)



-- Run format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- Better window swapping
mapx.nnoremap("<C-h>", "<C-w>h")
mapx.nnoremap("<C-j>", "<C-w>j")
mapx.nnoremap("<C-k>", "<C-w>k")
mapx.nnoremap("<C-l>", "<C-w>l")

-- Some small tooling
mapx.noremap('<leader>ww', '<Cmd>set wrap!<CR>', "Word Wrap Toggle") -- E.g: <leader>yy will yank current line to os clipboard
mapx.nnoremap("<leader>nh", "<Cmd>noh", "Clear search res. highlight")

-- Utils
mapx.nnoremap("<leader>P", ":ProjectMgr<Cr>", "Project manager") -- Open project manager.
-- mapx.nnoremap("<C-e>", ":NvimTreeToggle<Cr>", "Nvim Tree toggle") -- Toggle file explorer.
-- mapx.nnoremap("<C-o>", ":Lspsaga outline<Cr>")                                            -- Show symbols outline.

mapx.nnoremap("<C-e>", ":Explore<Cr>", "Explorer")                                                      -- Display undo tree
mapx.nnoremap("<leader>te", ":Telescope file_browser<Cr>", "Telescope - File browser")                  -- Display undo tree
mapx.nnoremap("<leader>tE", ":Telescope file_browser path=%:p:h select_buffer=true<Cr>",
	"Telescope - File browser in current folder")                                                         -- Display undo tree
mapx.nnoremap("<leader>tn", ":NoiceTelescope<Cr>", "Telescope - Notifications")                         -- Display undo tree
mapx.nnoremap("<leader>t:", ":Telescope commands<Cr>", "Telescope - Commands")                          -- Display undo tree
mapx.nnoremap("<leader>tm", ":Telescope marks<Cr>", "Telescope - Marks")                                -- Display undo tree
mapx.nnoremap("<leader>tu", ":Telescope undo<Cr>", "Telescope - Undos")                                 -- Display undo tree
mapx.nnoremap("<leader>tf", ":Telescope find_files<Cr>", "Telescope - Find files")                      -- Find files
mapx.nnoremap("<leader>tb", ":Telescope buffers<Cr>", "Telescope - Buffers")                            -- Buffers
mapx.nnoremap("<leader>tg", ":Telescope live_grep<Cr>", "Telescope - Grep")                             -- search in file
mapx.nnoremap("<leader>to", ":Telescope oldfiles<Cr>", "Telescope - Recent Files")                      -- recent files
mapx.nnoremap("<leader>tc", ":Telescope current_buffer_fuzzy_find<Cr>", "Telescope - Search in buffer") -- fuzzy search in buffer
mapx.nnoremap("<leader>td", ":Telescope diagnostics<Cr>", "Telescope - Diagnostics")                    -- fuzzy search in buffer
mapx.nnoremap("<leader>tqq", ":Telescope quickfix<Cr>", "Telescope - Quickfix")                         -- fuzzy search in buffer
mapx.nnoremap("<leader>tqh", ":Telescope quickfixhistory<Cr>", "Telescope - Quickfix History")          -- fuzzy search in buffer
mapx.nnoremap("<leader>tqh", ":Telescope vim_options<Cr>", "Telescope - Vim Options")                   -- fuzzy search in buffer

-- Telescope LSP

mapx.nnoremap("<leader>tlsw", ":Telescope lsp_workspace_symbols<Cr>", "Telescope - LSP Workspace Symbols") -- fuzzy search in buffer
mapx.nnoremap("<leader>tlsd", ":Telescope lsp_document_symbols<Cr>", "Telescope - LSP Document Symbols")   -- fuzzy search in buffer
mapx.nnoremap("<leader>tltd", ":Telescope lsp_type_definitions<Cr>", "Telescope - LSP Type Definitions")   -- fuzzy search in buffer
-- LEave it here for a while, but those are set up on load only when typescript-tools kick in
-- mapx.nnoremap("<leader>tsia", ":TSToolsAddMissingImports<Cr>")
-- mapx.nnoremap("<leader>tsir", ":TSToolsRemoveUnusedImports<Cr>")
-- mapx.nnoremap("<leader>tsio", ":TSToolsOrganizeImports<Cr>")
-- mapx.nnoremap("<leader>tsis", ":TSToolsSortImports<Cr>")
-- mapx.nnoremap("<leader>tsru", ":TSToolsRemoveUnused<Cr>")
-- mapx.nnoremap("<leader>tsgs", ":TSToolsGoToSourceDefinition<Cr>")
-- mapx.nnoremap("<leader>tsfr", ":TSToolsFileReferences<Cr>")
-- mapx.nnoremap("<leader>tsfa", ":TSToolsFixAll<Cr>")
-- mapx.nnoremap("<leader>tsrf", ":TSToolsRenameFile<Cr>")

-- mapx.nnoremap("<M-f>", ":lua MiniFiles.open()<Cr>") -- Mini files manager

-- LspSaga calls
mapx.nnoremap("<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
mapx.nnoremap("<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

mapx.nnoremap("<C-A>", "<cmd>LspRestart<CR>")
mapx.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Diagnostics - Previous")
mapx.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Diagnostics - Next")
mapx.nnoremap(
	"[c",
	"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
	"Diagnostics - Previous ERROR"
)
mapx.nnoremap(
	"]c",
	"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
	"Diagnostics - Next ERROR"

)

mapx.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
mapx.inoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
mapx.nnoremap("do", "<cmd>Lspsaga code_action<CR>", "Code Action")
mapx.nnoremap(
	"se",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	"Line Diagnostics"
)

vim.keymap.set({ "n", "x" }, "ca", function()
	require('actions-preview').code_actions()
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "cc", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

-- Close and pin buffer
mapx.nnoremap("<leader>bcc", "<Cmd>BufferClose<CR>", opts)
mapx.nnoremap("<leader>bc,", "<Cmd>BufferCloseBuffersLeft<CR>", opts)
mapx.nnoremap("<leader>bc.", "<Cmd>BufferCloseBuffersRight<CR>", opts)
mapx.nnoremap("<leader>bco", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
mapx.nnoremap("<leader>bv", "<Cmd>BufferPin<CR>", opts)
mapx.nnoremap("<leader>br", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- Switch to previous next buffer
mapx.nnoremap("<leader>b,", "<Cmd>BufferPrevious<CR>", opts)
mapx.nnoremap("<leader>b.", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
mapx.nnoremap("<leader>bm,", "<Cmd>BufferMovePrevious<CR>", opts)
mapx.nnoremap("<leader>bm.", "<Cmd>BufferMoveNext<CR>", opts)

--
mapx.nnoremap("<leader>wf", "<Cmd>SessionSearch<CR>", opts)
mapx.nnoremap("<leader>ws", "<Cmd>SessionSave<CR>", opts)
mapx.nnoremap("<leader>wa", "<Cmd>SessionToggleAutoSave<CR>", opts)


-- Registers
-- mapx.nnoremap("\"\"", "<Cmd>Registers<CR>", opts)

-- Dashboard
mapx.nnoremap("<leader>aa", "<Cmd>Alpha<CR>", opts)
vim.keymap.set({ "n", "x" }, "ad", function()
	require("snacks").dashboard.open()
end, { noremap = true, silent = true })

-- Neogit
mapx.nnoremap("<leader>ng", "<Cmd>Neogit<CR>", opts)

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
