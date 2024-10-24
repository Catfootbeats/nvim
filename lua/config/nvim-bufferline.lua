vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        numbers = function(opts)
            return string.format(opts.ordinal)
        end,
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}

local map = vim.keymap
local opt = {noremap = true, silent = true }
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
map.set("n", "<A-d>", "<Cmd>BufferLinePickClose<CR>", opt)
map.set("n", "gb", "<Cmd>BufferLinePick<CR>",opt)