vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd('TextYankPost',{
    callback = function()
      vim.highlight.on_yank {
        timeout = 300
      }
    end
  }
)

vim.cmd('colorscheme one')
vim.background=dark