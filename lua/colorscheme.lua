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
vim.cmd [[
augroup set_filetype
    au! BufRead,BufNewFile *.cppm,*.ixx setfiletype cpp
    au! BufRead,BufNewFile *.vert,*.frag,*.comp,*.geom,*.tess setfiletype glsl
augroup end
]]
-- 透明
local enable_transparent_color = true
if enable_transparent_color then
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

vim.cmd [[
    set clipboard-=unnamedplus
]]

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.cmd [[
silent! colorscheme nord
]]

-- More custom options goes here
