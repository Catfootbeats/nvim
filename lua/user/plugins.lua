local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(
    function(use)
  
    -- Packer 可以管理自己
    use 'wbthomason/packer.nvim'

    -- others
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  
    -- 主题
    use 'sainnhe/everforest'
    use 'rakr/vim-one'

    -- nvim-tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }
  
    -- bufferline TODO关闭页面快捷键
    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    -- lualine
      use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
      })
    use("arkav/lualine-lsp-progress")

    -- telescope文件模糊搜索
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    -- CMake工具
    -- https://github.com/Civitasv/cmake-tools.nvim
    use 'Civitasv/cmake-tools.nvim'
    -- telescope extensions
    -- use("LinArcX/telescope-env.nvim")
    -- use("nvim-telescope/telescope-ui-select.nvim")
    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use {"nvim-treesitter/nvim-treesitter-textobjects", run = ":TSUpdate",}

    use 'JoosepAlviste/nvim-ts-context-commentstring'
    -- 注释
    use "numToStr/Comment.nvim" -- Easily comment stuff

    -- dashboard-nvim
    use("glepnir/dashboard-nvim")

    -- project
    use("ahmedkhalf/project.nvim")

    -- git
    use "lewis6991/gitsigns.nvim"

    -- 文件大纲
    use "simrat39/symbols-outline.nvim"

    -- tab补全
    use 'ervandew/supertab'

    

    ---------- COC ----------
    -- use {'neoclide/coc.nvim', branch = 'release'}

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    ---------------- LSP ---------------
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

    -- Debugger
    use {'mfussenegger/nvim-dap'}
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'

    -- 终端
    use "akinsho/toggleterm.nvim"
    -- UI 增强
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- 自动括号补全
    use('windwp/nvim-autopairs')
    -- 代码格式化
    use("mhartington/formatter.nvim")
    -- Lua 增强
    use("folke/lua-dev.nvim")
    -- JSON 增强
    use("b0o/schemastore.nvim")    
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
  end)
