require("nvim-dap-virtual-text").setup({
    enabled = true,                     -- 启用插件
    enabled_commands = true,            -- 创建命令
    highlight_changed_variables = true, -- 高亮变化的值
    show_stop_reason = true,            -- 显示停止原因
    commented = false,                  -- 前缀虚拟文本为注释
})
