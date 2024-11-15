-- base
vim.g.mapleader = '`'
vim.opt.updatetime = 400
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'
-- allow the mouse to be used in Nvim https://zhuanlan.zhihu.com/p/38477934
vim.opt.backup = false

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = false -- tabs are spaces, mainly because of python
vim.opt.wrap = false-- switch line in a lang line
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = false -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint
-- https://segmentfault.com/a/1190000021101602
-- 设置空格和Tab字符可见 set list
-- vim.o.list = false
-- 如果使用tab字符可见需要把expandtab关掉
-- cinoptions cinwords自动缩进
vim.cmd [[
    set ru ls=2
    set listchars=trail:⋅,extends:❯,precedes:❮
    set listchars=tab:\|· 
    set signcolumn=number
    set cinoptions=j1,(0,ws,Ws,g0,:0,=0,l1
    set cinwords=if,else,switch,case,for,while,do
    set showbreak=↪
    set switchbuf=useopen
    set exrc
    set foldtext='+--'
    set bri wrap
    set termguicolors
    set cc=100
]]

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

vim.cmd [[
augroup disable_formatoptions_cro
autocmd!
autocmd BufEnter * setlocal formatoptions-=cro
augroup end
]]

vim.cmd [[
augroup disable_swap_exists_warning
autocmd!
autocmd SwapExists * let v:swapchoice = "e"
augroup end
]]

vim.lsp.set_log_level("warn")

local default_opts = {
    nerd_fonts = true,
    disable_notify = true,
    transparent_color = true,
    more_cpp_ftdetect = true,
    enable_signature_help = true,
    enable_inlay_hint = true,
    enable_clipboard = true,
}

(function()
    local data_path = vim.fn.stdpath('data') .. '/lua'
    local file_name = data_path .. '/opts.json'
    local file = io.open(file_name, 'r')
    if file then
        local content = file:read('*a')
        file:close()
        local result = vim.fn.json_decode(content)
        for k, v in pairs(result) do
            default_opts[k] = v
        end
    end
end)()

-- format
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "c", "cpp", "md", "txt", "c.snippets", "cpp.snippets" },
    callback = function()
        vim.b.autoformat = true
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
    end,
})

return setmetatable({}, {
    __newindex = function(_, k, v)
        rawset(default_opts, k, v)
        local data_path = vim.fn.stdpath('data') .. '/lua'
        if vim.fn.isdirectory(data_path) ~= 1 then
            vim.fn.mkdir(data_path, 'p')
        end
        local file_name = data_path .. '/opts.json'
        local file = io.open(file_name, 'w')
        assert(file, string.format("cannot open file '%s' for write", file_name))
        file:write(vim.fn.json_encode(default_opts))
        file:close()
    end,
    __index = function(_, k)
        return rawget(default_opts, k)
    end,
})
