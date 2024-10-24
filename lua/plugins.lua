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
	-- theme
	{
  		"neanias/everforest-nvim",
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
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

	-- Indent Blankline 
	-- This plugin adds indentation guides to Neovim. It uses Neovim's virtual text feature and no conceal
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- lualine
	{
    	'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		'arkav/lualine-lsp-progress',
		dependencies = { 'nvim-lualine/lualine.nvim' }
	},

	-- CMake tools
	-- { 'Civitasv/cmake-tools.nvim' }, TODO

	-- telescope文件模糊搜索
	{
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
	-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	-- highlight
	{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "kotlin", "python" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    	end
 	},
	-- 批量注释
	{
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    }
	},
	-- gitsign
	"lewis6991/gitsigns.nvim",
	-- 文件大纲
	'simrat39/symbols-outline.nvim',
	-- tab补全
	'ervandew/supertab',
    -- LSP manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
})

---- plugin configs ----
require('config.nvim-tree-config')
require('config.nvim-bufferline')
require('config.nvim-indent-blankline')
-- request('config.nvim-cmake-tools')
require('config.nvim-lualine')
require('config.nvim-telescope')
require('config.nvim-gitsigns')
require('config.symbols-outline')
require('config.comment')

