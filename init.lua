require('options')
require('plugins')
require('colorscheme')
require('keymaps')

function print(...)
   vim.notify(vim.inspect({...})) 
end
