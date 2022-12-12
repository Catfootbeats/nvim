vim.g.maploader = " "
vim.g.maplocalleader = " "
-- 保存本地变量
local map = vim.keymap
local opt = {noremap = true, silent = true }

-- 之后就可以这样映射按键了
-- map('模式','按键','映射为XX',opt)

--翻页功能
map.set("n", "<C-u>", "5k", opt)
map.set("n", "<C-d>", "5j", opt)

-- 窗口拆分
map.set("n", "sv", ":vsp<CR>", opt)
map.set("n", "sh", ":sp<CR>", opt)
map.set("n", "sc", "<C-w>c", opt)
map.set("n", "so", "<C-w>o", opt) -- close others
-- sv 水平分屏
-- sh 垂直分屏
-- sc 关闭当前分屏 (s = close)
-- so 关闭其他分屏 (o = other)
-- s>s<s=sjsk 分屏比例控制

-- 比例控制（不常用，因为支持鼠标拖拽）
map.set("n", "s>", ":vertical resize +20<CR>", opt)
map.set("n", "s<", ":vertical resize -20<CR>", opt)
map.set("n", "s=", "<C-w>=", opt)
map.set("n", "sj", ":resize +10<CR>",opt)
map.set("n", "sk", ":resize -10<CR>",opt)

--窗口跳转
map.set("n", "<A-h>", "<C-w>h", opt)
map.set("n", "<A-j>", "<C-w>j", opt)
map.set("n", "<A-k>", "<C-w>k", opt)
map.set("n", "<A-l>", "<C-w>l", opt)

-- 映射ESC
map.set("i", "jk", "<Esc>", opts)

-- 插入模式移动光标
map.set("i","<C-[>","<Left>", opt)
map.set("i","<C-]>","<Right>", opt)
map.set("i","<C-p>","<Up>", opt)
map.set("i","<C-n>","<Down>", opt)

-- 保存和退出
map.set("n","<C-s>","<Cmd>w<CR>")
map.set("n","<C-q>","<Cmd>q<CR>")

-- 配置NvimTreeToggle快捷键
map.set("n","<A-m>", ":NvimTreeToggle<CR>", opt)

-- bufferline 左右Tab切换
map.set("n","<C-h>",":BufferLineCyclePrev<CR>", opt)
map.set("n","<C-l>",":BufferLineCycleNext<CR>", opt)
map.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>",opt)
map.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>",opt)
map.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>",opt)
map.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>",opt)
map.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>",opt)
map.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>",opt)
map.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>",opt)
map.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>",opt)
map.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>",opt)
map.set("n", "<A-d>", ":bdemlete %<CR>", opt)
