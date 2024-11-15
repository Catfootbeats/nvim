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
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- 'glepnir/zephyr-nvim',
	-- 'shaunsingh/nord.nvim',
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
	    config = function() require'config.nvim-autopairs' end,
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
	-- plugin develop
	-- { "folke/neodev.nvim", config = function() require"neodev".setup{} end, },
	-- {
	--     "folke/lazydev.nvim",
	--     ft = { "lua" },
	--     requires = { "Bilal2453/luvit-meta", },
	--     config = function() require"lazydev".setup{} end,
	-- },
----------------------------------------------------------------------------------
	-- session and projects
	{
		'stevearc/stickybuf.nvim',
		config = function() require 'stickybuf'.setup() end,
    },
	-- {
	--     "startup-nvim/startup.nvim",
	--     requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	--     config = function()
	--         require"startup".setup()
	--     end,
	-- },
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
	{
		'Civitasv/cmake-tools.nvim',
		requires = "nvim-lua/plenary.nvim",
		config = function() require 'config.cmake-tools' end,
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
			-- "nvim-telescope/telescope-live-grep-raw.nvim",
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
			-- 'chrisgrieser/cmp_yanky',
			-- 'petertriho/cmp-git',
			'lukas-reineke/cmp-rg',
			-- 'roobert/tailwindcss-colorizer-cmp.nvim',
			"lukas-reineke/cmp-under-comparator",
			-- 'hrsh7th/cmp-copilot', -- INFO: uncomment this for AI completion
			-- {
			--     'Ninlives/cmp-rime',
			--     run = ':UpdateRemotePlugins | !rm -rf /tmp/tmp-pyrime && git clone https://github.com/Ninlives/pyrime /tmp/tmp-pyrime && cd /tmp/tmp-pyrime && python setup.py install --prefix ~/.local',
			-- },
			-- {
			--     os.getenv('ARCHIBATE_COMPUTER') and '/home/bate/Codes/cmp-rime' or 'archibate/cmp-rime',
			--     run = 'make',
			-- },
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
		config = function() require ("config.trouble") end,
    },
	-- ui tweaking
	"folke/zen-mode.nvim",
	{
		"folke/twilight.nvim",
		config = function() require ("config.twilight") end,
    },
    "MunifTanjim/nui.nvim",
	{
        'rcarriga/nvim-dap-ui',
        dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-neotest/nvim-nio',
			'theHamsta/nvim-dap-virtual-text',
		},
		config = function() require ("config.nvim-dap") end,
    },
    {
        'archibate/gpt4o',
		run = ':UpdateRemotePlugins'
    },
    {
        'archibate/genius.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
		},
		config = function () require "config.genius" end,
	},
	-- markdown editing
	-- "HakonHarnes/img-clip.nvim",
	-- 'MeanderingProgrammer/render-markdown.nvim',
	{
		'iamcco/markdown-preview.nvim',
		run = function() vim.fn["mkdp#util#install"]() end,
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		config = function() vim.cmd [[let g:mkdp_browser = '/usr/bin/chromium']] end,
		ft = { "markdown" },
		dependencies = 'iamcco/mathjax-support-for-mkdp',
	},
	{
		'ferrine/md-img-paste.vim',
		config = function()
			vim.cmd [[
let g:mdip_imgdir = 'img' " save image in ./img
let g:mdip_imgname = 'image'
autocmd FileType markdown nnoremap <silent> mp :call mdip#MarkdownClipboardImage()<CR>
        ]]
		end,
		ft = { "markdown" },
	},
----------------------------------------------------------------------------------
	-- highlight and textobjects
	{
        "nvim-treesitter/nvim-treesitter",
        run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
        -- build = ":TSUpdate", old way to Sync
        dependencies = {
			'p00f/nvim-ts-rainbow',
			'nvim-treesitter/nvim-treesitter-textobjects',
			-- 'nvim-treesitter/nvim-treesitter-context',
			'JoosepAlviste/nvim-ts-context-commentstring',
			'windwp/nvim-ts-autotag',
			'andymass/vim-matchup',
			'mfussenegger/nvim-treehopper',
		},
    	config = function () require('config.nvim-treesitter') end,
    },
	{
		'stevearc/aerial.nvim',
		config = function() require ("config.aerial") end,
    },
-----------------------------------------------------------------------
	-- git support
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",         -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim",        -- optional
			"ibhagwan/fzf-lua",              -- optional
		},
		config = function() require('neogit').setup {} end,
	},
    -- 文件大纲
    {
        'simrat39/symbols-outline.nvim',
		config = function() require 'config.symbols-outline' end,
	},
	-- tab补全
    'ervandew/supertab',
----------------------------------------------------------------------------------
    -- LSP manager
    {
        'williamboman/mason.nvim',
        dependencies = {
			'williamboman/mason-lspconfig.nvim',
			"mason-org/mason-registry",
		},
		run = ":MasonUpdate",
		config = function() require ("config.mason") end,
    },
	{
		'neovim/nvim-lspconfig',
		config = function() require ("config.lspconfig") end,
	},
	{
		'ray-x/lsp_signature.nvim',
		config = function() require ("config.lsp-signature") end,
	},
	{
		'dgagn/diagflow.nvim',
		config = function() require ("config.diagflow") end,
    },
----------------------------------------------------------------------------------
	-- cursor motion
	{
		"folke/which-key.nvim",
		config = function() require "config.which-key" end,
	},
	{
		"phaazon/hop.nvim",
		config = function() require "config.hop" end,
	},
})
