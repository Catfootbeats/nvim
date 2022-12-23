local dap = require("dap")

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = 'executable',
    command = "C:\\Users\\Windows\\AppData\\Local\\nvim-data\\mason\\bin\\OpenDebugAD7.cmd",
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
        end,

        cwd = "${workspaceFolder}",
        stopAtEntry = true,
    },
}
dap.configurations.c = dap.configurations.cpp
