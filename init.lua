-- 基础配置
require("user/base")
-- 快捷键映射
require("user/maps")
-- Packer插件管理
require("user/plugins")
-- 主题设置
require("user/color")
-- 插件配置
-- require("plugin-config/rainbow.vim")
require("user/plugin-config/cmp")
require("user/lsp")
require("user/plugin-config/nvim-tree")
require("user/plugin-config/bufferline")
require("user/plugin-config/nvim-treesitter")
require("user/plugin-config/lualine")
require("user/plugin-config/telescope")
require("user/plugin-config/autopairs")
require("user/plugin-config/comment")
require("user/plugin-config/symbols-outline")

-- -- 内置LSP
-- require("lsp/setup")
-- require("lsp/cmp")
-- require("lsp/ui")
-- 格式化
--require("lsp/null-ls")
-- DSP断点调试
--require("dap/nvim-dap")
-- 复制到Windows剪贴板 utils
--require("utils/fix-yank")
