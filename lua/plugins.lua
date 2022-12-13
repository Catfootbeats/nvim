local status_ok, packer = pcall(require, "packer")
 if not status_ok then
  vim.notify("没有安装Packer.nvim Not install Packer.nvim") 
  return
end

packer.startup({
    function()
  
    -- Packer 可以管理自己
    use 'wbthomason/packer.nvim'
  
    -- 主题
    use 'sainnhe/everforest'

    -- 彩虹括号 失效
    use 'luochen1990/rainbow'
    
    -- nvim-tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }
  
    -- bufferline TODO关闭页面快捷键 切换页面快捷键
    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons'
    }
  
    -- nvim-tree
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use("p00f/nvim-ts-rainbow")
  
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
    -- telescope extensions
    use("LinArcX/telescope-env.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")

    -- dashboard-nvim
    use("glepnir/dashboard-nvim")

    -- project
    use("ahmedkhalf/project.nvim")

    -- git
    use "lewis6991/gitsigns.nvim"

    -- 文件大纲
    use "simrat39/symbols-outline.nvim"

    if paccker_bootstrap then
        packer.sync()
    end

    ---------- COC ----------
    use {'neoclide/coc.nvim', branch = 'release'}

    -- tab补全
    use 'ervandew/supertab'

    
--    ---------------- LSP ---------------
--    use({ "williamboman/nvim-lsp-installer" })
--    -- Lspconfig
--    use({ "neovim/nvim-lspconfig" })
--    -- 补全引擎
--    use("hrsh7th/nvim-cmp")
--    -- Snippet 引擎
--    use("hrsh7th/vim-vsnip")
--    -- 补全源
--    use("hrsh7th/cmp-vsnip")
--    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
--    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
--    use("hrsh7th/cmp-path") -- { name = 'path' }
--    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
--    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- UI 增强
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- 自动括号补全
    use('windwp/nvim-autopairs')
    -- 代码格式化
    use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- TypeScript 增强
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    -- Lua 增强
    use("folke/lua-dev.nvim")
    -- JSON 增强
    use("b0o/schemastore.nvim")
    end,
    config = {
      max_jobs = 16,
      display = {
      open_fn = function()
          return require('packer.util').float { border = 'rounded' }
      end,
    }
    }
})

   -- 每次保存 plugins.lua 自动安装插件
   -- move to autocmds.lua
-- pcall(
--   vim.cmd,
--   [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )
