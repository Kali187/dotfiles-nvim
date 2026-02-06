local plugins = {
	-- Editor support.
	-- The next few plugins are really the IDE feel.
	{ 'github/copilot.vim' },
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = {
			{
				"nvim-mini/mini.icons",
				opts = {
				}
			}
		},

		config = function()
			require "plugin-configs.oil"
		end,
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"refractalize/oil-git-status.nvim",

		dependencies = {
			"stevearc/oil.nvim",
		},

		config = true,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@diagnostic disable-next-line: undefined-doc-name
		---@type snacks.Config
		opts = {
			dashboard = require("plugin-configs.snacks-dashboard"),
		},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter"
		},
		config = function()
			require "plugin-configs.neotest"
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{ "<leader>fs", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "<leader>fS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "<leader>fr", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "<leader>fR", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>",      mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require "plugin-configs.mason"
		end,
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	},
	{
		"jghauser/mkdir.nvim"
	},
	{
		'kosayoda/nvim-lightbulb',
		config = function()
			require "plugin-configs.lightbulb"
		end

	},
	{
		"andythigpen/nvim-coverage",
		version = "*",
		config = function()
			require("coverage").setup {
				auto_reload = true
			}
		end
	},

	{
		"romgrk/barbar.nvim",
		dependencies = { "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"kyazdani42/nvim-web-devicons"          -- OPTIONAL: for file icons
		},
		config = function()
			require "plugin-configs.barbar"
		end,
		version = "^1.0.0" -- optional: only update when a new 1.x version is release
	},
	{
		"mg979/vim-visual-multi"
	},
	{
		"tpope/vim-surround"
	},
	{
		"tpope/vim-characterize"
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		opts = {}
	},
	{
		"olrtg/nvim-emmet",
		config = function()
			vim.keymap.set({ "n", "v" }, "<leader>ee", require("nvim-emmet").wrap_with_abbreviation)
		end
	},
	{
		'famiu/bufdelete.nvim'
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require "plugin-configs.lualine-evil"
		end
	},
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			require "plugin-configs.actions-preview"
		end
	},
	{
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
			---@diagnostic disable-next-line: unused-local
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
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@diagnostic disable-next-line: undefined-doc-name
		---@type ibl.config
		opts = {}
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		config = function()
			require "plugin-configs.auto-session"
		end
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require "plugin-configs.noice"
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require "plugin-configs.treesitter"
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects"
	},
	{
		"editorconfig/editorconfig-vim"
	},
	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },

		version = '1.*',

		---@diagnostic disable-next-line: undefined-doc-name
		---@type blink.cmp.Config
		opts = {
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
				implementation = "lua",
				sorts = {
					'score', -- Primary sort: by fuzzy matching score
					'sort_text', -- Secondary sort: by sortText field if scores are equal
					'label', -- Tertiary sort: by label if still tied
				}
			}
		},
		opts_extend = { "sources.default" }
	},
	{
		"b0o/mapx.nvim",
		config = function()
			require "keyboard-mappings"
		end
	},
	{
		"f-person/git-blame.nvim"
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup {}
		end
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
				plugins = {
					marks = true,
					registers = true
				}
			}
		end
	},
	{
		"hedyhli/outline.nvim",
		config = function()
			vim.keymap.set("n", "<leader>oo", "<cmd>Outline<CR>", {
				desc = "Toggle Outline"
			})
			require("outline").setup {}
		end
	},
	{
		"tpope/vim-endwise"
	},
	{
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
},
	{
		"yamatsum/nvim-nonicons",
		dependencies = { "kyazdani42/nvim-web-devicons" }
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-dap.nvim", "debugloop/telescope-undo.nvim" },
		config = function()
			require "plugin-configs.telescope"
		end
	},
	{ "ahmedkhalf/project.nvim", },
	{
		"ldelossa/nvim-dap-projects",
		config = function()
			require("nvim-dap-projects").search_project_config()
		end
	},
	{
		"rmagatti/goto-preview",
		event = "BufEnter",
		config = true -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require "notify"
			notify.setup {
				background_colour = "#222222"
			}
			vim.notify = notify
		end
	},
	{
		"rebelot/kanagawa.nvim"
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui" },
		keys = { { "<leader>ddt", function()
			require('dap').toggle_breakpoint()
		end }, { "<leader>ddc", function()
			require('dap').continue()
		end } },
		config = function()
			require "plugin-configs.nvim-dap"
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		config = function()
			require "plugin-configs.nvim-dap-gui"
		end
	},
	{ "theHamsta/nvim-dap-virtual-text"
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" }
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } -- optional picker via telescope
		},
		event = "LspAttach",
		opts = {
			keymaps = {
				disable_defaults = true,
				visual = {
					["<leader>ca"] = "code_action"
				},
				normal = {
					["<leader>ca"] = "code_action"
				}
			},
			notify = {
				enabled = true,
				on_empty = true
			},
			signs = {
				quickfix = { "", {
					link = "DiagnosticWarning"
				} },
				others = { "", {
					link = "DiagnosticWarning"
				} },
				refactor = { "", {
					link = "DiagnosticInfo"
				} },
				["refactor.move"] = { "󰪹", {
					link = "DiagnosticInfo"
				} },
				["refactor.extract"] = { "", {
					link = "DiagnosticError"
				} },
				["source.organizeImports"] = { "", {
					link = "DiagnosticWarning"
				} },
				["source.fixAll"] = { "󰃢", {
					link = "DiagnosticError"
				} },
				["source"] = { "", {
					link = "DiagnosticError"
				} },
				["rename"] = { "󰑕", {
					link = "DiagnosticWarning"
				} },
				["codeAction"] = { "", {
					link = "DiagnosticWarning"
				} }
			}

		}
	},
	{
		"NeogitOrg/neogit",
		dependencies = { "nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim",             -- optional - Diff integration
			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim"       -- optional
		},
		config = function()
			require("neogit").setup({
				kind = "floating", -- opens neogit in a split
				signs = {
					-- { CLOSED, OPENED }
					section = { "", "" },
					item = { "", "" },
					hunk = { "", "" }
				},
				integrations = {
					diffview = true
				} -- adds integration with diffview.nvim
			})
		end
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

		-- TODO: Clean up all plugins

		config = function()
			---@diagnostic disable-next-line: different-requires
			require("telescope").load_extension "lazygit"
		end,
		keys = { {
			"<leader>lg",
			"<cmd>LazyGit<cr>",
			desc = "LazyGit"
		} }
	},

	{
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>yf",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>yd",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<leader>yy",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- mark netrw as loaded so it's not loaded at all.
			--
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			vim.g.loaded_netrwPlugin = 1
		end,
	},
	-- {
	-- 	"nvim-telescope/telescope-file-browser.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	-- },
	{
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
	},
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {}
	},
	{
		"NStefan002/screenkey.nvim",
		lazy = false,
		version = "*" -- or branch = "main", to use the latest commit
	},
	{
		'mawkler/jsx-element.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-treesitter/nvim-treesitter-textobjects' },
		ft = { 'typescriptreact', 'javascriptreact', 'javascript' },
		opts = {}
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end
	} }

return plugins
