--[[保存自动更新
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
--]]

 local status_ok, packer = pcall(require, "packer")
 if not status_ok then
   return
 end

packer.init {
  display = {
    open_fn = function()
        return require('packer.util').float { border = 'rounded' }
    end,
  }
}

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'sainnhe/everforest'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
end)
