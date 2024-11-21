local function os_capture(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	if raw then return s end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', ' ')
	return s
end

local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end



local whichkey = require "which-key"

local keymap = {
	{ "<leader>d",  group = "DAP",                                                             nowait = false,                  remap = false },
	{ "<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", desc = "Conditional Breakpoint", nowait = false, remap = false },
	{ "<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>",        desc = "Evaluate Input",         nowait = false, remap = false },
	{ "<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>",                               desc = "Run to Cursor",          nowait = false, remap = false },
	{ "<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>",                           desc = "Scopes",                 nowait = false, remap = false },
	{ "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>",                                    desc = "Toggle UI",              nowait = false, remap = false },
	{ "<leader>db", "<cmd>lua require'dap'.step_back()<cr>",                                   desc = "Step Back",              nowait = false, remap = false },
	{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>",                                    desc = "Continue",               nowait = false, remap = false },
	{ "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>",                                  desc = "Disconnect",             nowait = false, remap = false },
	{ "<leader>de", "<cmd>lua require'dapui'.eval()<cr>",                                      desc = "Evaluate",               nowait = false, remap = false },
	{ "<leader>dg", "<cmd>lua require'dap'.session()<cr>",                                     desc = "Get Session",            nowait = false, remap = false },
	{ "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>",                            desc = "Hover Variables",        nowait = false, remap = false },
	{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",                                   desc = "Step Into",              nowait = false, remap = false },
	{ "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",                                   desc = "Step Over",              nowait = false, remap = false },
	{ "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>",                                desc = "Pause",                  nowait = false, remap = false },
	{ "<leader>dq", "<cmd>lua require'dap'.close()<cr>",                                       desc = "Quit",                   nowait = false, remap = false },
	{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>",                                 desc = "Toggle Repl",            nowait = false, remap = false },
	{ "<leader>ds", "<cmd>lua require'dap'.continue()<cr>",                                    desc = "Start",                  nowait = false, remap = false },
	{ "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",                           desc = "Toggle Breakpoint",      nowait = false, remap = false },
	{ "<leader>du", "<cmd>lua require'dap'.step_out()<cr>",                                    desc = "Step Out",               nowait = false, remap = false },
	{ "<leader>dx", "<cmd>lua require'dap'.terminate() require'dapui'.close()<cr>",         desc = "Terminate",              nowait = false, remap = false },
}

whichkey.add(keymap)
--- require("legendary.integrations.which-key").bind_whichkey(keymap, opts, false)

local keymap_v = {
	{ "<leader>d",  group = "Debug",                      mode = "v",        nowait = false, remap = false },
	{ "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate", mode = "v",     nowait = false, remap = false },
}
whichkey.add(keymap_v)
--- require("legendary.integrations.which-key").bind_whichkey(keymap_v, opts, false)

---- LANGUAGE CONFIGRATION ----

local dap = require('dap')
dap.defaults.fallback.switchbuf = 'useopen,uselast'

---- C/CPP ----

dap.adapters.gdb = {
    type = "executable",
	command = vim.fn.exepath("gdb"),
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "gdb",
        request = "launch",
        program = function()
			local ok, xmakepath = pcall(function()
				return require("xmake.project_config").info.target.exec_path
			end)
			if ok then
				return xmakepath
			end
			local exepath
			if package.cpath:match("%p[\\|/]?%p(%a+)") == "dll" then
				exepath = 'a.exe'
			else
				exepath = 'a.out'
			end
            if file_exists(exepath) then
                return exepath
            end
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
        cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
	{
		name = "Select and attach to process",
		type = "gdb",
		request = "attach",
		program = function()
			return vim.fn.input('Process PID: ', vim.fn.getcwd() .. '/', 'file')
        end,
		pid = function()
			local name = vim.fn.input('Executable name (filter): ')
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}
dap.configurations.c = dap.configurations.cpp

---- Rust ----

dap.configurations.rust = dap.configurations.cpp

---- Python ----

dap.adapters.python = function(cb, config)
	if config.request == 'attach' then
		---@diagnostic disable-next-line: undefined-field
		local port = (config.connect or config).port
		---@diagnostic disable-next-line: undefined-field
		local host = (config.connect or config).host or '127.0.0.1'
		cb({
			type = 'server',
			port = assert(port, '`connect.port` is required for a python `attach` configuration'),
			host = host,
			options = {
				source_filetype = 'python',
			},
		})
	else
		cb({
			type = 'executable',
			command = vim.fn.stdpath("data") .. '/mason/packages/debugpy/bin/python',
			args = { '-m', 'debugpy.adapter' },
			options = {
				source_filetype = 'python',
			},
		})
	end
end

dap.configurations.python = {
	{
		type = 'python',
		request = 'launch',
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			return os_capture('which python')
		end,
	},
}

---- bash sh ----

dap.adapters.bashdb = {
	type = 'executable',
	command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
	name = 'bashdb',
}

dap.configurations.sh = {
	{
		type = 'bashdb',
		request = 'launch',
		name = "Launch file",
		showDebugOutput = true,
		pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
		pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
		trace = true,
		file = "${file}",
		program = "${file}",
		cwd = '${workspaceFolder}',
		pathCat = "cat",
		pathBash = "/bin/bash",
		pathMkfifo = "mkfifo",
		pathPkill = "pkill",
		args = {},
		env = {},
		terminalKind = "integrated",
	}
}

dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = { vim.fn.stdpath("data") .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
}

---- JavaScript ----

dap.configurations.javascript = {
	{
		name = 'Launch file',
		type = 'node2',
		request = 'launch',
		program = '${file}',
		cwd = '${workspaceFolder}',
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal',
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = 'Attach to process',
		type = 'node2',
		request = 'attach',
		processId = require 'dap.utils'.pick_process,
	},
}
