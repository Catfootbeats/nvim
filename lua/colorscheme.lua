-- define your colorscheme here
local colorscheme = 'everforest'

vim.opt.cursorline = true
vim.opt.termguicolors = true

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

