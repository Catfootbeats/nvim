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
require("user/plugin-config/gitsigns")
require("user/plugin-config/toggleterm")
require("user/plugin-config/dashboard")
require("user/plugin-config/formatter")
-- dap
require("user/dap/dap")
require("user/dap/dap-ui")
require("user/dap/cpp")
