-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.api.nvim_create_user_command("Quit", function()
    vim.cmd [[ wall | if &buftype == 'quickfix' | cclose | elseif &buftype == 'prompt' | quit! | else | quit | endif ]]
end, { desc = 'Quit current window' })

-- 使用q退出 --------------------------------------------------------
vim.keymap.set("n", "q", "<cmd>Quit<CR>", { silent = true })
vim.keymap.set("v", "q", "<Esc>", { silent = true })
vim.keymap.set("n", "Q", "q", opts)

-- Ctrl+Insert 复制；Shift+Insert 粘贴 ------------------------------
vim.keymap.set({ "n", "v" }, "<C-Insert>", "\"+y", { silent = true })
vim.keymap.set("i", "<C-Insert>", "<Esc>\"+yya", { silent = true })
vim.keymap.set({ "n", "v" }, "<S-Insert>", "\"+p", { silent = true })
vim.keymap.set("i", "<S-Insert>", "<C-r>+", { silent = true })

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<A-h>', '<C-w>h', opts)
vim.keymap.set('n', '<A-j>', '<C-w>j', opts)
vim.keymap.set('n', '<A-k>', '<C-w>k', opts)
vim.keymap.set('n', '<A-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<A-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<A-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', opts)

-- Fire Explores
vim.keymap.set("n", "<A-m>", ":NvimTreeToggle<CR>", opts)

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set({ "v", "n" }, "gh", "(v:count == 0 || v:count == 1 ? '^^' : '^^' . (v:count - 1) . 'l')",
    { silent = true, expr = true })
vim.keymap.set({ "v", "n" }, "gl", "(v:count == 0 || v:count == 1 ? '^$' : '^$' . (v:count - 1) . 'h')",
    { silent = true, expr = true })
vim.keymap.set({ "v", "n" }, "gm", "gM", { noremap = true })
vim.keymap.set({ "v", "n" }, "gM", "gm", { noremap = true })
-- 保存
vim.keymap.set({ "v", "n", "i" }, "<F4>", "<cmd>wa<CR>")
-- 自动修正
vim.keymap.set({ "v", "n", "i" }, "<F6>", "<cmd>cclose | Trouble qflist toggle<CR>")
-- 输出窗口(f18是那个键口阿╰（‵□′）╯)
vim.keymap.set({ "v", "n", "i" }, "<F18>", "<cmd>copen<CR>")
-- 错误列表
vim.keymap.set({ "v", "n", "i", "t" }, "<F9>", "<cmd>Trouble diagnostics toggle focus=false<CR>", { silent = true })
vim.keymap.set({ "v", "n", "i", "t" }, "<F21>", "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>",
    { silent = true })
-- CMake
if pcall(require, "cmake-tools") then
    vim.keymap.set({ "v", "n", "i", "t" }, "<F5>",
        "<cmd>wa<CR><cmd>if luaeval('require\"cmake-tools\".is_cmake_project()')|call execute('CMakeRun')|else|call execute('TermExec cmd=./run.sh')|endif<CR>",
        { silent = true })
    vim.keymap.set({ "v", "n", "i", "t" }, "<F17>",
        "<cmd>wa<CR><cmd>if luaeval('require\"cmake-tools\".is_cmake_project()')|call execute('CMakeStopRunner')|call execute('CMakeStopExecutor')|else|call execute('TermExec cmd=\\<C-c>')|endif<CR>",
        { silent = true })
    vim.keymap.set("n", "cmr",
        "<cmd>wa<CR><cmd>if luaeval('require\"cmake-tools\".is_cmake_project()')|call execute('CMakeRun')|else|call execute('TermExec cmd=./run.sh')|endif<CR>",
        { silent = true, desc = 'CMakeRun' })
    vim.keymap.set("n", "cmb",
        "<cmd>wa<CR><cmd>if luaeval('require\"cmake-tools\".is_cmake_project()')|call execute('CMakeBuild')|else|call execute('TermExec cmd=make')|endif<CR>",
        { silent = true, desc = 'CMakeBuild' })
    vim.keymap.set("n", "cmc",
        "<cmd>wa<CR><cmd>if luaeval('require\"cmake-tools\".is_cmake_project()')|call execute('CMakeGenerate')|else|call execute('TermExec cmd=./configure')|endif<CR>",
        { silent = true, desc = 'CMakeGenerate' })
    vim.keymap.set("n", "cms",
        "<cmd>wa<CR><cmd>if luaeval('require\"cmake-tools\".is_cmake_project()')|call execute('CMakeStopRunner')|call execute('CMakeStopExecutor')|else|call execute('TermExec cmd=\\<C-c>')|endif<CR>",
        { silent = true, desc = 'CMakeStopRunner' })
else
    vim.keymap.set({ "v", "n", "i", "t" }, "<F5>", "<cmd>wa<CR><cmd>call execute('TermExec cmd=./run.sh')<CR>",
        { silent = true })
    vim.keymap.set({ "v", "n", "i", "t" }, "<F17>", "<cmd>wa<CR><cmd>call execute('TermExec cmd=\\<C-c>')<CR>",
        { silent = true })
end
-- neogit
-- vim.keymap.set({"v", "n", "i", "t"}, "<F10>", "<cmd>Neogit<CR><cmd>set foldtext='+'<CR>", { silent = true })
vim.keymap.set({ "v", "n", "i", "t" }, "<F10>", function()
    require 'neogit'.open {}
end, { silent = true })

-- zen mode 压扁模式
vim.keymap.set({ 'v', 'n', 'i', 't' }, '<Ins>', [[<Cmd>ZenMode<CR>]])

-- 使用jk回到normal mode
vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set("i", "kj", "<Esc>", { silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { silent = true })
vim.keymap.set("t", "kj", "<C-\\><C-n>", { silent = true })

-- 开关终端
-- vim.keymap.set({"v", "n", "i", "t"}, "<C-t>", "<cmd>ToggleTerm<CR>", { silent = true })
vim.keymap.set({ "v", "n", "i", "t" }, "<F8>", "<cmd>ToggleTerm<CR>", { silent = true })
vim.keymap.set({ "v" }, "<C-S-t>", "<cmd>ToggleTermSendVisualSelection<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<C-S-t>", "<cmd>ToggleTermSendCurrentLine<CR>", { silent = true })
vim.keymap.set({ "t" }, "<C-S-t>", "<cmd>ToggleTermToggleAll<CR>", { silent = true })
-- 格式化代码
vim.keymap.set({ 'v' }, 'g=', [[<Cmd>Neoformat<CR>]])
vim.keymap.set({ 'n' }, 'g=', function()
    vim.lsp.buf.format()
end)
vim.keymap.set({ 'v', 'n', 'i' }, '<F16>', function()
    vim.lsp.buf.format()
end)
-- 查看文档
vim.keymap.set({ 'v', 'n' }, 'K', function()
    vim.lsp.buf.hover()
end)
-- 函数签名
vim.keymap.set({ 'v', 'n' }, 'gK', function()
    vim.lsp.buf.signature_help()
end)
-- 代码修复
vim.keymap.set({ 'v', 'n' }, 'gw', function()
    vim.lsp.buf.code_action({
        apply = true,
    })
end)
-- 重命名变量
vim.keymap.set({ 'v', 'n' }, 'gn', function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = 'Rename symbol' })
vim.keymap.set({ 'v', 'n' }, 'gN', function()
    return ":IncRename "
end, { expr = true, desc = 'Rename symbol' })
-- 查找符号定义
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = 'Goto definition' })
-- 查找符号声明
vim.keymap.set("n", "gD", function()
    vim.lsp.buf.declaration()
end, { desc = 'Goto declaration' })
-- 开关静态分析错误列表
vim.keymap.set("n", "gss", "<cmd>Trouble diagnostics toggle<CR>")
-- 开关编译器报错列表
vim.keymap.set("n", "gsl", "<cmd>cclose | Trouble qflist toggle<CR>")
vim.keymap.set("n", "gsg", "<cmd>Neogit<CR>")
-- 当前光标下的静态分析错误
vim.keymap.set("n", "gsd", function()
    vim.diagnostic.open_float({
        scope = "cursor",
        focusable = false,
        close_events = {
            "CursorMoved",
            "CursorMovedI",
            "BufHidden",
            "InsertCharPre",
            "WinLeave",
            "BufEnter",
            "BufLeave",
        },
    })
end, { desc = 'Diagnostics under cursor' })
-- 开关 Inlay Hint
vim.keymap.set({ "v", "n" }, "gsi", function()
    if vim.lsp.inlay_hint ~= nil then
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end
end, { desc = "Toggle inlay hint" })
-- 重启 LSP
vim.keymap.set({ "v", "n" }, "gsu", "<cmd>LspStop | LspStart<CR>", { silent = true, desc = "Restart LSP" })
-- 开关项目文件树
vim.keymap.set({ "v", "n" }, "gsp", "<cmd>NvimTreeFindFileToggle<CR>", { silent = true, desc = "Toggle Nvim Tree", })
-- 开关大纲视图
vim.keymap.set({ "v", "n" }, "gso", "<cmd>AerialToggle!<CR>", { desc = "Toggle aerial outline" })
-- 查找类型定义
vim.keymap.set({ "v", "n" }, "gy", "<cmd>Telescope lsp_type_definitions<CR>", { desc = 'Goto type definition' })
-- 查找所有引用
vim.keymap.set({ "v", "n" }, "gr", "<cmd>Telescope lsp_references<CR>", { desc = 'Find references' })
-- 查找函数实现
vim.keymap.set({ "v", "n" }, "gY", "<cmd>Telescope lsp_implementations<CR>", { desc = 'Find implementations' })
-- 查看全部
vim.keymap.set({ "v", "n" }, "gz", "<cmd>Trouble lsp toggle<CR>")
-- 查看类型继承图
vim.keymap.set({ "v", "n" }, "gst", function()
    vim.lsp.buf.typehierarchy("subtypes")
end, { desc = 'List derived class hierarchy' })
vim.keymap.set({ "v", "n" }, "gsT", function()
    vim.lsp.buf.typehierarchy("supertypes")
end, { desc = 'List base class hierarchy' })
-- 头文件/源文件跳转
vim.keymap.set({ "v", "n" }, "go", "<cmd>ClangdSwitchSourceHeader<CR>", { silent = true })
vim.keymap.set({ "v", "n" }, "gO", "<cmd>split | ClangdSwitchSourceHeader<CR>", { silent = true })
vim.keymap.set({ "v", "n" }, "g<C-o>", "<cmd>vsplit | ClangdSwitchSourceHeader<CR>", { silent = true })

vim.keymap.set({ 'n' }, '<S-Tab>', '<C-o>')
-- vim.keymap.set({'i'}, '<C-Space>', '<Space>')

-- vim.keymap.set({'v', 'n'}, 'gp', ':GPT<Space>')
-- vim.keymap.set({'v', 'n'}, 'gP', ':GPT!<Space>')
-- vim.keymap.set({'i'}, '<C-Space>', '<Cmd>GPT<CR>')
-- vim.keymap.set({'i', 'n'}, '<C-t>', '<Cmd>-8,+8GPT refactor this code<CR>')
-- vim.keymap.set({'v'}, '<C-t>', '<Cmd>GPT refactor this code<CR>')

vim.cmd [[
augroup quickfix_setlocal
autocmd!
autocmd FileType qf setlocal wrap
\ | vnoremap <buffer> <F6> <cmd>cclose<CR>
\ | nnoremap <buffer> <F6> <cmd>cclose<CR>
\ | vnoremap <buffer> <F18> <cmd>cclose<CR>
\ | nnoremap <buffer> <F18> <cmd>cclose<CR>
\ | nnoremap <buffer> <Esc> <cmd>cclose<CR>
augroup END
]]

vim.cmd [[
augroup neogit_setlocal
autocmd!
autocmd FileType NeogitStatus nnoremap <buffer> <F10> <cmd>:q<CR>
autocmd FileType NeogitStatus vnoremap <buffer> <F10> <cmd>:q<CR>
autocmd FileType NeogitStatus inoremap <buffer> <F10> <cmd>:q<CR>
autocmd FileType NeogitStatus nnoremap <buffer> gsg <cmd>:q<CR>
augroup END
]]

return vim.keymap.set
