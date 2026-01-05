local plugins = { -- Editor support.
	-- The next few plugins are really the IDE feel.
	{
		'github/copilot.vim',
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require "plugin-configs.mason"
		end,
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}, "jghauser/mkdir.nvim", {
	'kosayoda/nvim-lightbulb',
	config = function()
		require "plugin-configs.lightbulb"
	end

}, {
	"andythigpen/nvim-coverage",
	version = "*",
	config = function()
		require("coverage").setup {
			auto_reload = true
		}
	end
}, { "mg979/vim-visual-multi" }, { "tpope/vim-surround" }, { "tpope/vim-characterize" }, {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {}
}, {
	"otavioschwanck/arrow.nvim",
	dependencies = { { "echasnovski/mini.icons" } },
	opts = {
		show_icons = true,
		leader_key = "a;",     -- Recommended to be a single key
		buffer_leader_key = "a'" -- Per Buffer Mappings
	}
}, {
	"olrtg/nvim-emmet",
	config = function()
		vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
	end
}, { 'famiu/bufdelete.nvim' }, {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require "plugin-configs.lualine-evil"
	end
}, {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	ft = { "typescript", "typescriptreact" -- "javascript",
		-- "javascriptreact",
	},

	config = function(_, opts)
		local api = require("typescript-tools.api")

		opts.handlers = {
			["textDocument/publishDiagnostics"] = api.filter_diagnostics(
				{ 80001 -- Ignore this might be converted to a ES export
				})
		}

		require("typescript-tools").setup(opts)
	end,
	opts = {
		expose_as_code_action = "all",
		complete_function_calls = false,
		jsx_close_tag = {
			enable = true,
			filetypes = { "typescriptreact" }
		},
		on_attach = function(config, bufNr)
			vim.keymap.set({ "n", "v" }, "<leader>ttio", ":TSToolsOrganizeImports<CR>", {
				desc = "Imports Organize",
				silent = true,
				buffer = bufNr
			})

			vim.keymap.set({ "n", "v" }, "<leader>ttis", ":TSToolsSortImports<CR>", {
				desc = "Imports Sort",
				silent = true,
				buffer = bufNr
			})

			vim.keymap.set({ "n", "v" }, "<leader>ttir", ":TSToolsRemoveUnusedImports<CR>", {
				desc = "Imports remove unused",
				silent = true,
				buffer = bufNr
			})

			vim.keymap.set({ "n", "v" }, "<leader>ttia", ":TSToolsAddMissingImports<CR>", {
				desc = "Imports Add All missing",
				silent = true,
				buffer = bufNr
			})

			vim.keymap.set({ "n", "v" }, "<leader>ttrf", ":TSToolsRenameFile<CR>", {
				desc = "Rename File",
				silent = true,
				buffer = bufNr
			})
		end
	}
}, {
	"gorbit99/codewindow.nvim",
	config = function()
		require "plugin-configs.codewindow"
	end
}, {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {}
}, {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require "plugin-configs.auto-session"
	end
}, {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require "plugin-configs.noice"
	end
}, {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require "plugin-configs.treesitter"
	end
}, "nvim-treesitter/nvim-treesitter-textobjects", "editorconfig/editorconfig-vim", {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },

	version = '1.*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = 'enter'
		},

		appearance = {
			nerd_font_variant = 'mono'
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			documentation = {
				auto_show = true
			}
		},

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' }
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning"
		}
	},
	opts_extend = { "sources.default" }
}, {
	"b0o/mapx.nvim",
	config = function()
		require "keyboard-mappings"
	end
}, "f-person/git-blame.nvim", {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup {}
	end
}, {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup {
			win = {
				title = false
			},
			plugins = {
				marks = true,
				registers = true
			}
		}
	end
}, {
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	dependencies = { "kyazdani42/nvim-web-devicons" },
	-- 	config = function()
	-- 		require "plugin-configs.nvim-tree"
	-- 	end
	-- }, {
	"hedyhli/outline.nvim",
	config = function()
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", {
			desc = "Toggle Outline"
		})
		require("outline").setup {}
	end
}, "tpope/vim-endwise", {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
	},
	keys = { {
		"<leader>xx",
		"<cmd>Trouble diagnostics toggle<cr>",
		desc = "Diagnostics (Trouble)"
	}, {
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)"
	}, {
		"<leader>xs",
		"<cmd>Trouble symbols toggle focus=false<cr>",
		desc = "Symbols (Trouble)"
	}, {
		"<leader>xc",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "LSP Definitions / references / ... (Trouble)"
	}, {
		"<leader>xL",
		"<cmd>Trouble loclist toggle<cr>",
		desc = "Location List (Trouble)"
	}, {
		"<leader>xQ",
		"<cmd>Trouble qflist toggle<cr>",
		desc = "Quickfix List (Trouble)"
	} }
}, "MunifTanjim/prettier.nvim", {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require "plugin-configs.mini"
	end
}, {
	"yamatsum/nvim-nonicons",
	dependencies = { "kyazdani42/nvim-web-devicons" }
}, {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-dap.nvim", "debugloop/telescope-undo.nvim" },
	config = function()
		require "plugin-configs.telescope"
	end
}, {
	"ldelossa/nvim-dap-projects",
	config = function()
		require("nvim-dap-projects").search_project_config()
	end
}, {
	"rmagatti/goto-preview",
	event = "BufEnter",
	config = true -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
}, {
	"goolord/alpha-nvim",
	config = function()
		require("plugin-configs.dashboard").setup()
	end
}, {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require "notify"
		notify.setup {

			background_colour = "#000000"

		}
		vim.notify = notify
	end
}, { "rebelot/kanagawa.nvim" }, {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	keys = {
		{ "<leader>ddt", function() require('dap').toggle_breakpoint() end },
		{ "<leader>ddc", function() require('dap').continue() end },
	},
	config = function()
		require "plugin-configs.nvim-dap"
	end
}, {
	"rcarriga/nvim-dap-ui",
	dependencies = { "nvim-neotest/nvim-nio" },
	config = function()
		require "plugin-configs.nvim-dap-gui"
	end
}, {
	"romgrk/barbar.nvim",
	dependencies = { "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"kyazdani42/nvim-web-devicons"           -- OPTIONAL: for file icons
	},
	config = function()
		require "plugin-configs.barbar"
	end,
	version = "^1.0.0" -- optional: only update when a new 1.x version is released
}, "theHamsta/nvim-dap-virtual-text",
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },

			-- optional picker via telescope
			{ "nvim-telescope/telescope.nvim" },
			-- optional picker via fzf-lua
			{ "ibhagwan/fzf-lua" },
			-- .. or via snacks
			{
				"folke/snacks.nvim",
				opts = {
					terminal = {},
				}
			}
		},
		event = "LspAttach",
		opts = {},
	}, {
	"charludo/projectmgr.nvim",
	lazy = false, -- important!
	dependencies = { {
		"AstroNvim/astrocore",
		opts = {
			mappings = {
				n = {
					["<Leader>P"] = {
						"<Cmd>ProjectMgr<CR>",
						desc = "Open ProjectMgr panel"
					}
				}
			}
		}
	} }
}, {
	"NeogitOrg/neogit",
	dependencies = { "nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim",              -- optional - Diff integration
		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim"        -- optional
	},
	config = true
}, {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

	-- TODO: Clean up all plugins

	config = function()
		require("telescope").load_extension "lazygit"
	end,
	keys = { {
		"<leader>lg",
		"<cmd>LazyGit<cr>",
		desc = "LazyGit"
	} }
}, {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}, {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			FIX = {
				-- HACK: Just a test comment
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = {
				icon = " ",
				color = "info"
			},
			HACK = {
				icon = " ",
				color = "warning"
			},
			WARN = {
				icon = " ",
				color = "warning",
				alt = { "WARNING", "XXX" }
			},
			PERF = {
				icon = "󱑟 ",
				alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" }
			},
			NOTE = {
				icon = "󰎛 ",
				color = "hint",
				alt = { "INFO" }
			},
			TEST = {
				icon = "󰙨 ",
				color = "test",
				alt = { "TESTING", "PASSED", "FAILED" }
			}
		},
		search = {
			command = "rg",
			args = { -- "--color=never",
				-- "--no-heading",
				"--with-filename", "--line-number", "--column" },
			-- regex that will be used to match keywords.
			-- don't replace the (KEYWORDS) placeholder
			pattern = [[\b(KEYWORDS):]] -- ripgrep regex
		}
	}
}, {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" -- optional dependency
	},
	opts = {
		-- configurations go here
		theme = {
			normal = {
				fg = "#737aa2",
				bg = "#060606"
			},
			dirname = {
				fg = "#737aa2"
			},
			basename = {
				bold = true
			}
		}
	}
}, {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {}
}, {
	'prichrd/netrw.nvim',
	opts = {}
}, {
	"NStefan002/screenkey.nvim",
	lazy = false,
	version = "*" -- or branch = "main", to use the latest commit
}, {
	"mistricky/codesnap.nvim",
	build = "make"
}, {
	'mawkler/jsx-element.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-treesitter/nvim-treesitter-textobjects' },
	ft = { 'typescriptreact', 'javascriptreact', 'javascript' },
	opts = {}
}, {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup()
	end
} }

return plugins
