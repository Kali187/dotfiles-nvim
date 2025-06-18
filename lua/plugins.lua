local plugins = { -- Editor support.
	-- The next few plugins are really the IDE feel.
	{
		"williamboman/mason.nvim",
		config = function()
			require "plugin-configs.mason"
		end,
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}, "jghauser/mkdir.nvim", {
	"andythigpen/nvim-coverage",
	version = "*",
	config = function()
		require("coverage").setup {
			auto_reload = true
		}
	end
}, { "mg979/vim-visual-multi" }, {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {}
}, {
	"otavioschwanck/arrow.nvim",
	dependencies = { { "echasnovski/mini.icons" } },
	opts = {
		show_icons = true,
		leader_key = ";",     -- Recommended to be a single key
		buffer_leader_key = "§" -- Per Buffer Mappings
	}
}, {
	"olrtg/nvim-emmet",
	config = function()
		vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
	end
},

	{
		'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function()
			require('plugin-configs.galaxyline')
		end,
		--           -- some optional icons
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
	},
	{
		"b0o/incline.nvim",
		config = function()
			require("incline").setup()
		end,
		-- Optional: Lazy load Incline
		event = 'VeryLazy',
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {}
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
}, "nvim-treesitter/nvim-treesitter-textobjects", "editorconfig/editorconfig-vim",
	{
		'hrsh7th/cmp-cmdline',
		enabled = true,
		lazy = true,
		event = { 'InsertEnter', 'CmdlineEnter' },
		dependencies = {
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
		},
		config = function()
			require "plugin-configs.cmp-cmdline"
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require "plugin-configs.cmp"
		end,
		dependencies = { "hrsh7th/cmp-nvim-lsp", "onsails/lspkind-nvim", "SergioRibera/cmp-dotenv", "hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol", "hrsh7th/cmp-nvim-lsp-signature-help", "petertriho/cmp-git",
			"rcarriga/cmp-dap", {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make"
		}, {
			"tzachar/fuzzy.nvim",
			dependencies = { "nvim-telescope/telescope-fzf-native.nvim" }
		}, {
			"tzachar/cmp-fuzzy-path",
			dependencies = "tzachar/fuzzy.nvim"
		} }
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
		require("which-key").setup {}
	end
},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup {
				ui = {
					virtual_text = false,
					sign = false,
					code_action = ""
				},
				symbol_in_winbar = {
					enable = false,
					folder_level = 1
				}
			}
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter" }
	},
	--
	-- Window management
	{
		"aserowy/tmux.nvim",
		config = function()
			require "plugin-configs.tmux"
		end
	}, -- File management.
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require "plugin-configs.nvim-tree"
		end
	},
	{
		"hedyhli/outline.nvim",
		config = function()
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
		"<leader>cs",
		"<cmd>Trouble symbols toggle focus=false<cr>",
		desc = "Symbols (Trouble)"
	}, {
		"<leader>cl",
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
},

	-- Visual.
	-- "neovim/nvim-lspconfig", {
	--     "nvimtools/none-ls.nvim",
	--     dependencies = {"nvimtools/none-ls-extras.nvim"},
	--     config = function()
	--         require "plugin-configs.none-ls"
	--     end
	-- },
	"MunifTanjim/prettier.nvim",
	{
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
},
	--	{
	--	"lervag/vimtex",
	--	lazy = false,   -- we don't want to lazy load VimTeX
	--	init = function()
	--		-- VimTeX configuration goes here, e.g.
	--	end
	--},
	---- { "dmmulroy/ts-error-translator.nvim" },
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
		"goolord/alpha-nvim",
		config = function()
			require("plugin-configs.dashboard").setup {}
		end
	}, {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require "notify"
		notify.setup {

			background_colour = "#000000",

		}
		vim.notify = notify
	end
}, {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup {}
		vim.cmd [[colorscheme catppuccin-mocha]]
	end
}, {
	"mfussenegger/nvim-dap",
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
	}, "theHamsta/nvim-dap-virtual-text",
	{
		"romgrk/barbar.nvim",
		dependencies = { "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"kyazdani42/nvim-web-devicons"          -- OPTIONAL: for file icons
		},
		config = function()
			require "plugin-configs.barbar"
		end,
		version = "^1.0.0" -- optional: only update when a new 1.x version is released
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
},
	{
		"NeogitOrg/neogit",
		dependencies = { "nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim",             -- optional - Diff integration
			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim"       -- optional
		},
		config = true
	},
	{
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
	},
	-- 	{
	-- 	"HiPhish/rainbow-delimiters.nvim",
	-- 	config = function()
	-- 		require "plugin-configs.rainbow-delimiters"
	-- 	end
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
	}, {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup()
	end
} }


return plugins
