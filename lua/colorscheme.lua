-- -- define your colorscheme here
-- local colorscheme = 'everforest'
-- 

-- 
-- local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not is_ok then
--     vim.notify('colorscheme ' .. colorscheme .. ' not found!')
--     return
-- end
-- 
if require 'options'.more_cpp_ftdetect then
    vim.cmd [[
    augroup set_filetype
        au! BufRead,BufNewFile *.cppm,*.ixx setfiletype cpp
        au! BufRead,BufNewFile *.vert,*.frag,*.comp,*.geom,*.tess setfiletype glsl
    augroup end
    ]]
end
-- 透明
if require 'options'.transparent_color then
    vim.cmd [[
    augroup colorscheme_mock
    autocmd!
    autocmd ColorScheme * hi Normal guibg=none | hi def link LspInlayHint Comment
        " \ | hi LspReferenceText guibg=none
        " \ | hi LspReferenceRead guibg=none
        " \ | hi LspReferenceWrite guibg=none
    " hi NormalFloat guifg=#928374 guibg=#282828 |
    " hi WinSeparator guibg=none |
    " hi TreesitterContext gui=NONE guibg=#282828 |
    " hi TreesitterContextBottom gui=underline guisp=Grey
    augroup END
    ]]
end

if not require 'options'.enable_clipboard then
    vim.cmd [[
        set clipboard-=unnamedplus
    ]]
end

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.cmd [[
silent! colorscheme everforest
]]

-- More custom options goes here
