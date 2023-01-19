local dap = require("dap")
local file = require("user.utils.file")

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = 'executable',
    command = "C:\\Users\\Windows\\AppData\\Local\\nvim-data\\mason\\bin\\OpenDebugAD7.cmd",
    -- Windows
    options = {
    detached = false
  }
}
--[[]]
--[[ dap.configurations.cpp = { ]]
--[[     { ]]
--[[         name = "Launch file", ]]
--[[         type = "cppdbg", ]]
--[[         request = "launch", ]]
--[[         program = function() ]]
--[[             -- First, check if exists CMakeLists.txt ]]
--[[             local cwd = vim.fn.getcwd() ]]
--[[             if file.exists(cwd, "CMakeLists.txt") then ]]
--[[                 -- Then invoke cmake commands ]]
--[[                 -- Then ask user to provide execute file ]]
--[[                 return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file") ]]
--[[             else ]]
--[[                 local fileName = vim.fn.expand("%:t:r") ]]
--[[                 -- create this directory ]]
--[[                 os.execute("mkdir -p " .. "bin") ]]
--[[                 local cmd = "!g++ -g % -o bin/" .. fileName ]]
--[[                 -- First, compile it ]]
--[[                 vim.cmd(cmd) ]]
--[[                 -- Then, return it ]]
--[[                 return "${fileDirname}/bin/" .. fileName ]]
--[[             end ]]
--[[         end, ]]
--[[]]
--[[         cwd = "${workspaceFolder}", ]]
--[[         stopAtEntry = true, ]]
--[[]]
--[[         setupCommands = {   ]]
--[[             {  ]]
--[[                 text = '-enable-pretty-printing', ]]
--[[                 description =  'enable pretty printing', ]]
--[[                 ignoreFailures = false  ]]
--[[             }, ]]
--[[         }, ]]
--[[     }, ]]
--[[ } ]]
dap.configurations.cpp = {
  {
    name = "C++ Debug And Run",
    type = "codelldb",
    request = "launch",
    program = function()
      -- First, check if exists CMakeLists.txt
      local cwd = vim.fn.getcwd()
      if file.exists(cwd, "CMakeLists.txt") then
        -- Then invoke cmake commands
        -- Then ask user to provide execute file
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
      else
        local fileName = vim.fn.expand("%:t:r")
        -- create this directory
        os.execute("mkdir -p " .. "bin")
        local cmd = "!g++ -g % -o bin/" .. fileName
        -- First, compile it
        vim.cmd(cmd)
        -- Then, return it
        return "${fileDirname}/bin/" .. fileName
      end
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  },
}
dap.configurations.c = dap.configurations.cpp
