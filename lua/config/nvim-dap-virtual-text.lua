require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- 启用此插件（默认）
    enabled_commands = true,            -- 创建命令 DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, （DapVirtualTextForceRefresh 用于刷新，当调试适配器未通知其终止时）
    highlight_changed_variables = true, -- 使用 NvimDapVirtualTextChanged 高亮更改过的值，否则始终使用 NvimDapVirtualText
    highlight_new_as_changed = false,   -- 如果设置了 highlight_changed_variables，则新变量以相同方式高亮
    show_stop_reason = true,            -- 当因为异常停止时显示停止原因
    commented = false,                  -- 用注释字符串前缀虚拟文本
    only_first_definition = true,       -- 只在第一个定义处显示虚拟文本（如果有多个）
    all_references = false,             -- 在变量的所有引用上显示虚拟文本（不仅仅是定义）
    clear_on_continue = false,          -- 在“继续”时清除虚拟文本（可能在步进时造成闪烁）
    --- 回调函数，决定如何显示一个变量，或者是否应忽略它
    --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --- @param buf number
    --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --- @param node userdata tree-sitter 节点标识为变量定义或参考（见`:h tsnode`)
    --- @param options nvim_dap_virtual_text_options 当前的 nvim-dap-virtual-text 选项
    --- @return string|nil 虚拟文本应如何显示的文本，或 nil，如果不想显示这个变量
    display_callback = function(variable, buf, stackframe, node, options)
        if options.virt_text_pos == 'inline' then
            return ' = ' .. variable.value
        else
            return variable.name .. ' = ' .. variable.value
        end
    end,
    -- 虚拟文本的位置，参考`:h nvim_buf_set_extmark()`，默认尝试内联显示虚拟文本。使用'eol'设置到行尾
    virt_text_pos = vim.fn.has('nvim-0.10') == 1 and 'inline' or 'eol',

    -- 实验性功能：
    all_frames = false,      -- 不仅对当前堆栈帧，也对所有堆栈帧显示虚拟文本（在我的机器上只适用于debugpy）
    virt_lines = false,      -- 显示虚拟线而不是虚拟文本（可能会闪烁！）
    virt_text_win_col = nil, -- 将虚拟文本固定在窗口列中的位置（从第一条文本列开始），例如 80，以定位到第80列，参考`:h nvim_buf_set_extmark()`
}
