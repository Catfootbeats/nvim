vim.opt.backup = false
-- 设置相对行号
vim.opt.number = true
vim.opt.relativenumber = true
-- UTF-8
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- jk移动光标上下保留函数
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
-- 搜索高亮
vim.opt.hlsearch = true
-- 边输入边搜索
vim.opt.incsearch = true

-- 缩进两个空格等于一个Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- 很长一行自动换行
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoread = true
vim.bo.autoread = true

vim.opt.list = true

vim.opt.mouse = "a"
vim.opt.clipboard:append ("unnamedplus")
vim.api.nvim_command(':filetype plugin on')
