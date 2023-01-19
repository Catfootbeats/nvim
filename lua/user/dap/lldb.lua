local codelldb = require("user/plugin-config/codelldb")

local dap = require("dap")

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = codelldb.codelldb_path,
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    detached = false,
  }
}
