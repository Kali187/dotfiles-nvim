local mapx = require("mapx").setup({ global = true })

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts) -- Set location list with diagnostics



-- Run format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]] -- Format on save

-- tabs
vim.keymap.set("n", "<leader>Tn", "<cmd>tabnew<CR>",
	{ noremap = true, silent = true, desc = "New Tab" })          -- New tab
vim.keymap.set("n", "<leader>Tc", "<cmd>tabclose<CR>",
	{ noremap = true, silent = true, desc = "Close Current Tab" }) -- Close current tab
vim.keymap.set("n", "<leader>T]", "<cmd>tabnext<CR>",
	{ noremap = true, silent = true, desc = "Next Tab" })         -- Next tab
vim.keymap.set("n", "<leader>T[", "<cmd>tabprevious<CR>",
	{ noremap = true, silent = true, desc = "Previous Tab" })     -- Previous tab

-- window swapping
vim.keymap.set("n", "<C-h>", "<C-w>h",
	{ noremap = true, silent = true, desc = "Move to Left Window" }) -- Move to left window
vim.keymap.set("n", "<C-j>", "<C-w>j",
	{ noremap = true, silent = true, desc = "Move to Lower Window" }) -- Move to lower window
vim.keymap.set("n", "<C-k>", "<C-w>k",
	{ noremap = true, silent = true, desc = "Move to Upper Window" }) -- Move to upper window
vim.keymap.set("n", "<C-l>", "<C-w>l",
	{ noremap = true, silent = true, desc = "Move to Right Window" }) -- Move to right window

vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua builtin<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Builtin" })              -- FzfLua builtin
vim.keymap.set("n", "<leader>bb", "<cmd>FzfLua buffers<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Buffers" })              -- FzfLua buffers
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Find Files" })           -- FzfLua find files
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Live Grep" })            -- FzfLua live grep
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Help Tags" })            -- FzfLua help tags
vim.keymap.set("n", "<leader>fm", "<cmd>FzfLua marks<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Marks" })                -- FzfLua marks
vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Recent Files" })         -- FzfLua recent files
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua lsp_references<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP References" })       -- FzfLua LSP references
vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Document Symbols" }) -- FzfLua LSP document symbols
vim.keymap.set("n", "<leader>ft", "<cmd>FzfLua lsp_workspace_symbols<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Workspace Symbols" }) -- FzfLua LSP workspace symbols

-- Replacing all Telescope mappings with FzfLua ones, also ditchimn mapx
vim.keymap.set("n", "<leader>t:", "<cmd>FzfLua commands<CR>", { noremap = true, silent = true, desc = "FzfLua Commands" }) -- FzfLua Commands
vim.keymap.set("n", "<leader>th", "<cmd>FzfLua help_tags<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Help Tags" })                                                            -- FzfLua Help tags
vim.keymap.set("n", "<leader>tk", "<cmd>FzfLua keymaps<CR>", { noremap = true, silent = true, desc = "FzfLua Keymaps" })   -- FzfLua Keymaps
vim.keymap.set("n", "<leader>tm", "<cmd>FzfLua marks<CR>", { noremap = true, silent = true, desc = "FzfLua Marks" })       -- FzfLua Marks
vim.keymap.set("n", "<leader>tu", "<cmd>FzfLua undo<CR>", { noremap = true, silent = true, desc = "FzfLua Undos" })        -- FzfLua Undos
vim.keymap.set("n", "<leader>tf", "<cmd>FzfLua files<CR>", { noremap = true, silent = true, desc = "FzfLua Find Files" })  -- FzfLua find files
vim.keymap.set("n", "<leader>tb", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = true, desc = "FzfLua Buffers" })   -- FzfLua buffers
vim.keymap.set("n", "<leader>to", "<cmd>FzfLua oldfiles<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Recent Files" })                                                         -- FzfLua old files
vim.keymap.set("n", "<leader>tll", "<cmd>FzfLua loclist<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Location List" })                                                        -- FzfLua location list
vim.keymap.set("n", "<leader>tj", "<cmd>FzfLua jumps<CR>", { noremap = true, silent = true, desc = "FzfLua Jumps" })       -- FzfLua jumps

-- FzfLua grep
vim.keymap.set("n", "<leader>tgl", "<cmd>FzfLua live_grep<CR>", { noremap = true, silent = true, desc = "FzfLua Grep" }) -- FzfLua live grep
vim.keymap.set("n", "<leader>tgs", "<cmd>FzfLua grep_curbuf<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Search in Buffer" })                                                   -- FzfLua grep in current buffer

-- FzfLua diagnostics mappings
vim.keymap.set("n", "<leader>tdd", "<cmd>FzfLua diagnostics_document<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Document Diagnostics" }) -- FzfLua diagnostics
vim.keymap.set("n", "<leader>tdw", "<cmd>FzfLua diagnostics_workspace<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Workspace Diagnostics" }) -- FzfLua workspace diagnostics

-- FzfLua quickfix
vim.keymap.set("n", "<leader>tq", "<cmd>FzfLua quickfix<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Quickfix" }) -- FzfLua quickfix



-- mappings for FZFLua and: command_history, global,


-- FzfLua LSP mappings
vim.keymap.set("n", "<leader>tlr", "<cmd>FzfLua lsp_references<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP References" })      -- FzfLua LSP references
vim.keymap.set("n", "<leader>tld", "<cmd>FzfLua lsp_definitions<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Definitions" })     -- FzfLua LSP definitions
vim.keymap.set("n", "<leader>tlD", "<cmd>FzfLua lsp_declarations<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Declarations" })    -- FzfLua LSP declarations
vim.keymap.set("n", "<leader>tlt", "<cmd>FzfLua lsp_type_definitions<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Type Definitions" }) -- FzfLua LSP type definitions
vim.keymap.set("n", "<leader>tli", "<cmd>FzfLua lsp_implementations<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Implementations" }) -- FzfLua LSP implementations

vim.keymap.set("n", "<leader>tsw", "<cmd>FzfLua lsp_workspace_symbols<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Workspace Symbols" }) -- FzfLua LSP workspace symbols
vim.keymap.set("n", "<leader>tsd", "<cmd>FzfLua lsp_document_symbols<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Document Symbols" }) -- FzfLua LSP document symbol
-- lsp incoming and outgoing calls
vim.keymap.set("n", "<leader>tci", "<cmd>FzfLua lsp_incoming_calls<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Incoming Calls" }) -- FzfLua LSP incoming calls
vim.keymap.set("n", "<leader>tco", "<cmd>FzfLua lsp_outgoing_calls<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Outgoing Calls" }) -- FzfLua LSP outgoing calls


vim.keymap.set("n", "<leader>tlc", "<cmd>FzfLua lsp_code_actions<CR>",
	{ noremap = true, silent = true, desc = "FzfLua LSP Code Actions" })
vim.keymap.set("n", "<leader>tnm", "<cmd>Noice fzf<CR>",
	{ noremap = true, silent = true, desc = "FzfLua Noice Messages" })

-- Noice mappings
vim.keymap.set("n", "<leader>nm", "<cmd>Noice messages<CR>",
	{ noremap = true, silent = true, desc = "Noice Messages" }) -- Open Noice message history
vim.keymap.set("n", "<leader>nn", "<cmd>Noice dismiss<CR>",
	{ noremap = true, silent = true, desc = "Noice Dismiss" }) -- Dismiss Noice messages
vim.keymap.set("n", "<leader>np", "<cmd>Noice popup<CR>",
	{ noremap = true, silent = true, desc = "Noice Popup" })   -- Open Noice popup

-- LSP mappings
vim.keymap.set("n", "<C-A>", function()
	vim.cmd("LspRestart")
end, { noremap = true, silent = true, desc = "LSP - Restart LSP" }) -- Restart LSP

vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev()
end, { noremap = true, silent = true, desc = "Diagnostics - Previous" }) -- Go to previous diagnostic
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next()
end, { noremap = true, silent = true, desc = "Diagnostics - Next" }) -- Go to next diagnostics

vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { noremap = true, silent = true, desc = "Diagnostics - Previous ERROR" }) -- Go to previous ERROR diagnostic
vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { noremap = true, silent = true, desc = "Diagnostics - Next ERROR" }) -- Go to next ERROR diagnostic

-- Neotest mappings
vim.keymap.set("n", "<leader>trn", function()
	require("neotest").run.run()
end, { noremap = true, silent = true, desc = "Neotest - Run Nearest" })
vim.keymap.set("n", "<leader>trf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { noremap = true, silent = true, desc = "Neotest - Run File" })
vim.keymap.set("n", "<leader>trS", function()
	require("neotest").run.stop()
end, { noremap = true, silent = true, desc = "Neotest - Stop" })
vim.keymap.set("n", "<leader>trl", function()
	require("neotest").output_panel.toggle()
end, { noremap = true, silent = true, desc = "Neotest - Output Panel Toggle" })
vim.keymap.set("n", "<leader>trs", function()
	require("neotest").summary.toggle()
end, { noremap = true, silent = true, desc = "Neotest - Summary Toggle" })


-- Go to next ERROR diagnostic
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

vim.keymap.set("n", "<leader>bcc", "<Cmd>BufferClose<CR>",
	{ noremap = true, silent = true, desc = "Close current buffer" })        -- Close current buffer
vim.keymap.set("n", "<leader>bc,", "<Cmd>BufferCloseBuffersLeft<CR>",
	{ noremap = true, silent = true, desc = "Close buffers to the left" })   -- Close buffers to the left
vim.keymap.set("n", "<leader>bc.", "<Cmd>BufferCloseBuffersRight<CR>",
	{ noremap = true, silent = true, desc = "Close buffers to the right" })  -- Close buffers to the right
vim.keymap.set("n", "<leader>bco", "<Cmd>BufferCloseAllButCurrent<CR>",
	{ noremap = true, silent = true, desc = "Close all but current buffer" }) -- Close all but current buffer
vim.keymap.set("n", "<leader>bv", "<Cmd>BufferPin<CR>",
	{ noremap = true, silent = true, desc = "Pin/Unpin current buffer" })    -- Pin/Unpin current buffer
vim.keymap.set("n", "<leader>br", "<cmd>lua vim.lsp.buf.rename()<CR>",
	{ noremap = true, silent = true, desc = "Rename current buffer" })       -- Rename current buffers

vim.keymap.set("n", "<leader>bm,", "<Cmd>BufferMovePrevious<CR>",
	{ noremap = true, silent = true, desc = "Move buffer to previous position" })                                           -- Move buffer to previous position
vim.keymap.set("n", "<leader>bm.", "<Cmd>BufferMoveNext<CR>",
	{ noremap = true, silent = true, desc = "Move buffer to next position" })                                               -- Move buffer to next position
vim.keymap.set("n", "<leader>b,", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" }) -- Previous buffer
vim.keymap.set("n", "<leader>b.", "<Cmd>BufferNext<CR>", { noremap = true, silent = true, desc = "Next buffer" })         -- Next buffers


-- Dashboard
vim.keymap.set({ "n", "x" }, "aa", function()
	require("snacks").dashboard.open()
end, { noremap = true, silent = true }) -- Open Snacks dashboard

-- Neogit
vim.keymap.set("n", "<leader>ng", "<Cmd>Neogit<CR>", { noremap = true, silent = true, desc = "Neogit - Open Neogit" }) -- Open Neogit

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
