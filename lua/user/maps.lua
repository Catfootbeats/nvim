
vim.g.maplocalleader = ""
-- 保存本地变量
local map = vim.keymap
local opt = { noremap = true, silent = true }

-- 之后就可以这样映射按键了
-- map('模式','按键','映射为XX',opt)

--翻页功能
map.set("n", "<C-u>", "8k", opt)
map.set("n", "<C-d>", "8j", opt)

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

-- 视觉模式移动选定内容
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

-- 取消高亮
map.set("n", "<leader>nh", ":nohl<CR>")

-- 比例控制（不常用，因为支持鼠标拖拽）
map.set("n", "s>", ":vertical resize +20<CR>", opt)
map.set("n", "s<", ":vertical resize -20<CR>", opt)
map.set("n", "s=", "<C-w>=", opt)
map.set("n", "sj", ":resize +10<CR>", opt)
map.set("n", "sk", ":resize -10<CR>", opt)

--窗口跳转
map.set("n", "<A-h>", "<C-w>h", opt)
map.set("n", "<A-j>", "<C-w>j", opt)
map.set("n", "<A-k>", "<C-w>k", opt)
map.set("n", "<A-l>", "<C-w>l", opt)

-- 映射ESC
map.set("i", "jk", "<Esc>", opts)

-- 插入模式移动光标
map.set("i", "<C-[>", "<Left>", opt)
map.set("i", "<C-]>", "<Right>", opt)
map.set("i", "<C-p>", "<Up>", opt)
map.set("i", "<C-n>", "<Down>", opt)

-- 保存和退出
map.set("n", "<C-s>", "<Cmd>w<CR>")
map.set("n", "<C-q>", "<Cmd>q<CR>")

-- 配置NvimTreeToggle快捷键
map.set("n", "<A-m>", ":NvimTreeToggle<CR>", opt)

-- 格式化
map.set("n", "ff", ":Format<CR>", opt)
map.set("i", ";", ";<ESC>:Format<CR>i<Right><Right>", opt)

-- CMake构建以及运行
-- 生成数据库
map.set("n", "<leader><leader>s", ":!cmake -S . -B build  -DCMAKE_EXPORT_COMPILE_COMMANDS=1<CR>", opt)
map.set("n", "<leader><leader>b", ":!cmake --build build -j2<CR>", opt)
map.set("n", "<leader><leader>t", ":!cmake --build build -j2 --target test<CR>", opt)
map.set("n", "<leader><leader>r", ":!./run.bat<CR>", opt)

-- python
map.set("n", "<leader>py", "<cmd>!python %<CR>", { silent = true, noremap = true })

-- 断点
map.set({ "i", "n", "v" }, "<F5>", "<cmd>lua require'dap'.continue()<CR>", opt)
map.set({ "i", "n", "v" }, "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opt)
map.set({ "i", "n", "v" }, "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opt)
map.set({ "i", "n", "v" }, "<F12>", "<cmd>lua require'dap'.step_over()<CR>", opt)
map.set({ "i", "n", "v" }, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opt)
