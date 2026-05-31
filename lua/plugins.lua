local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	----------------------------------------------------------------------------------
	-- theme
	{
		"neanias/everforest-nvim",
		dependencies = {
			'rktjmp/lush.nvim',
		},
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
		end,
	},
	{ "catppuccin/nvim",      name = "catppuccin", priority = 1000 },
	'glepnir/zephyr-nvim',
	'shaunsingh/nord.nvim',
	----------------------------------------------------------------------------------
	-- base api
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	-- notification
	{
		"rcarriga/nvim-notify",
		config = function()
			require("config.notify")
		end,
	},
	----------------------------------------------------------------------------------
	-- buffer and files

	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("config.nvim-tree")
		end,
	},
	-- bufferline
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'famiu/bufdelete.nvim',
		},
		config = function() require 'config.bufferline' end,
	},
	{
		"tiagovla/scope.nvim",
		config = function() require 'scope'.setup {} end,
	},
	{
		'jakemason/ouroboros',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},

	----------------------------------------------------------------------------------

	-- Indent Blankline
	-- This plugin adds indentation guides to Neovim. It uses Neovim's virtual text feature and no conceal
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function() require 'config.nvim-indent-blankline' end,
	},

	-- status line
	{
		'nvim-lualine/lualine.nvim',
		config = function() require 'config.lualine' end,
		dependencies = {
			'archibate/lualine-time',
			'archibate/lualine-lsp-progress',
		},
	},
	-- brace pairing
	{
		'kylechui/nvim-surround',
		config = function() require 'config.nvim-surround' end,
	},
	{
		'm4xshen/autoclose.nvim',
		config = function() require 'config.autoclose' end,
	},
	{
		'windwp/nvim-autopairs',
		config = function() require 'config.nvim-autopairs' end,
	},
	"terryma/vim-expand-region",
	----------------------------------------------------------------------------------
	-- code actions
	{
		"sbdchd/neoformat",
		config = function() require "config.neoformat" end,
	},
	{
		"stevearc/conform.nvim",
		config = function() require "config.conform" end,
	},
	{
		"terrortylor/nvim-comment",
		config = function() require 'config.nvim-comment' end,
	},
	{
		'smjonas/inc-rename.nvim',
		config = function() require "inc_rename".setup {} end,
	},
	----------------------------------------------------------------------------------
	-- session and projects
	{
		'stevearc/stickybuf.nvim',
		config = function() require 'stickybuf'.setup() end,
	},
	{
		"ethanholz/nvim-lastplace",
		config = function() require 'nvim-lastplace'.setup {} end,
	},
	----------------------------------------------------------------------------------
	-- terminal and tasks

	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function() require 'config.toggleterm' end,
	},
	----------------------------------------------------------------------------------
	-- 文件模糊搜索
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make || true",
			},
			{
				"nvim-telescope/telescope-frecency.nvim",
				requires = { "tami5/sqlite.lua" }, -- need to install sqlite lib
			},
			"nvim-telescope/telescope-ui-select.nvim",
			'LinArcX/telescope-changes.nvim',
			'nvim-telescope/telescope-github.nvim',
		},
		config = function() require "config.telescope" end,
	},
	"ibhagwan/fzf-lua",

	-- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	----------------------------------------------------------------------------------
	-- Auto-completion engine
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{
				'onsails/lspkind-nvim',
				cond = function() return require 'options'.nerd_fonts end,
			},
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'f3fora/cmp-spell',
			'hrsh7th/cmp-calc',
			'hrsh7th/cmp-emoji',
			'lukas-reineke/cmp-rg',
			"lukas-reineke/cmp-under-comparator",
			'saadparwaiz1/cmp_luasnip',
			{
				'L3MON4D3/LuaSnip',
				run = 'make install_jsregexp || true',
				dependencies = {
					'rafamadriz/friendly-snippets',
				},
				config = function() require("config.luasnip") end,
			},
		},
		config = function() require("config.nvim-cmp") end,
	},
	-- lint and error signs
	{
		"folke/trouble.nvim",
		config = function() require("config.trouble") end,
	},
	-- ui tweaking
	"folke/zen-mode.nvim",
	{
		"folke/twilight.nvim",
		config = function() require("config.twilight") end,
	},
	"MunifTanjim/nui.nvim",
	----------------------------------------------------------------------------------
	-- highlight and textobjects
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
		dependencies = {
			'HiPhish/rainbow-delimiters.nvim',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'JoosepAlviste/nvim-ts-context-commentstring',
			'windwp/nvim-ts-autotag',
			'andymass/vim-matchup',
			'mfussenegger/nvim-treehopper',
		},
		config = function() require('config.nvim-treesitter') end,
	},
	-----------------------------------------------------------------------
	-- git support
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua",     -- optional
		},
		config = function() require('neogit').setup {} end,
	},
    -- 文件大纲
	{
		'stevearc/aerial.nvim',
		config = function() require("config.aerial") end,
	},
	-- tab补全
    'ervandew/supertab',
    -- TODO
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	----------------------------------------------------------------------------------
	-- LSP manager
	{
		'williamboman/mason.nvim',
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
		},
		run = ":MasonUpdate",
		config = function() require("config.mason") end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function() require("config.lspconfig") end,
	},
	{
		'ray-x/lsp_signature.nvim',
		config = function() require("config.lsp-signature") end,
	},
	{
		'dgagn/diagflow.nvim',
		config = function() require("config.diagflow") end,
	},
	----------------------------------------------------------------------------------
	-- cursor motion
	{
		"folke/which-key.nvim",
        dependencies = {
            'echasnovski/mini.icons',
		},
		config = function() require "config.which-key" end,
	},
})
