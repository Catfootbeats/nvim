local osys = require("cmake-tools.osys")
require("cmake-tools").setup {
    cmake_command = "cmake",                                                                                         -- this is used to specify cmake command path
    ctest_command = "ctest",                                                                                         -- this is used to specify ctest command path
    cmake_use_preset = true,
    cmake_regenerate_on_save = false, -- auto generate when save CMakeLists.txt
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
    cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
    -- support macro expansion:
    --       ${kit}
    --       ${kitGenerator}
    --       ${variant:xx}
    -- cmake_build_directory = "out/${variant:buildType}", -- this is used to specify generate directory for cmake, allows macro expansion
    cmake_build_directory = function()
        if osys.iswin32 then
            return "out\\${variant:buildType}"
        end
        return "out/${variant:buildType}"
    end,                                         -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
    cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
    cmake_compile_commands_from_lsp = true, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
    cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
    cmake_variants_message = {
        short = { show = true }, -- whether to show short message
        long = { show = true, max_length = 80 }, -- whether to show long message
    },
    cmake_dap_configuration = { -- debug settings for cmake
        name = "cpp",
        type = "gdb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
    },
    cmake_executor = { -- executor to use
        name = "quickfix", -- name of the executor
        opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
        default_opts = { -- a list of default and possible values for executors
            quickfix = {
                show = "always", -- "always", "only_on_error"
                position = "botright", -- "bottom", "top", "belowright"
                size = 10,
                encoding = "utf-8",
                auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
            },
            toggleterm = {
                direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                close_on_exit = true, -- whether close the terminal when exit
                auto_scroll = true, -- whether auto scroll to the bottom
            },
            overseer = {},
            terminal = {
                name = "CMake Terminal",
                prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
                split_direction = "horizontal", -- "horizontal", "vertical"
                split_size = 6,

                -- Window handling
                single_terminal_per_instance = true, -- Single viewport, multiple windows
                single_terminal_per_tab = true, -- Single viewport per tab
                keep_terminal_static_location = true, -- Static location of the viewport if avialable

                -- Running Tasks
                start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
                focus = false, -- Focus on terminal when cmake task is launched.
                do_not_add_newline = true, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.

            },
        },
    },
    cmake_runner = {
        -- name = "terminal",
        name = "toggleterm",
        opts = {},
        default_opts = { -- a list of default and possible values for runners
            quickfix = {
                show = "always", -- "always", "only_on_error"
                position = "belowright", -- "bottom", "top"
                size = 6,
                encoding = "utf-8",
                auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
            },
            toggleterm = {
                -- direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                -- direction = "tab", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                direction = "vertical", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                close_on_exit = false, -- whether close the terminal when exit
                singleton = false, -- single instance, autocloses the opened one, if present
                auto_scroll = true, -- whether auto scroll to the bottom
            },
            overseer = {},
            terminal = {
                name = "CMake Terminal",
                prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
                split_direction = "vertical", -- "horizontal", "vertical"
                split_size = 50,

                -- Window handling
                single_terminal_per_instance = true, -- Single viewport, multiple windows
                single_terminal_per_tab = true, -- Single viewport per tab
                keep_terminal_static_location = true, -- Static location of the viewport if avialable
                auto_resize = true,                   -- Resize the terminal if it already exists

                -- Running Tasks
                start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
                focus = false, -- Focus on terminal when cmake task is launched.
                do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.

            },
        },
    },
    cmake_notifications = {
        runner = { enabled = false },
        executor = { enabled = false },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
    },
    cmake_virtual_text_support = true,
}

local function is_cmake_tools_running()
    local job = require'cmake-tools.utils'.get_executor(require'cmake-tools.utils'.executor.name).job
    return not job or job.is_shutdown
end

local _terminal = require'cmake-tools.terminal'
local _quickfix = require'cmake-tools.quickfix'
-- local osys = require'cmake-tools.osys'
local notification = require'cmake-tools.notification'

local function shlex_quote(s)
    if s == "" then
        return [['']]
    end
    if s:find([["]]) and s:find([[\]]) then
        s = s:gsub([[\]], [[\\]])
        s = s:gsub([["]], [[\"]])
    end
    if s:find([["]]) then
        return "'" .. s .. "'"
    end
    return '"' .. s .. '"'
end



local notification_blacklist = {
    ['Exited with code 0'] = true,
    ['cmake'] = true,
}
local old_notification_notify = notification.notify
function notification.notify(msg, lvl, opts)
  if msg ~= nil and not notification_blacklist[msg] then
    return old_notification_notify(msg, lvl, opts)
  end
end

function _quickfix.has_active_job(opts)
  if not _quickfix.job or _quickfix.job.is_shutdown then
    return false
  end
  local log = require("cmake-tools.log")
  log.info("Stop running CMake job...")
  _quickfix.stop()
  -- local log = require("cmake-tools.log")
  -- log.error(
  --   "A CMake task is already running: "
  --     .. _quickfix.job.command
  --     .. " Stop it before trying to run a new CMake task."
  -- )
  return true
end

local scratch = require'cmake-tools.scratch'
function scratch.append(cmd)
    vim.schedule(function()
        if scratch.buffer ~= nil then
            vim.api.nvim_buf_set_lines(scratch.buffer, -1, -1, false, { cmd })
        end
    end)
end

-- vim.cmd [[
-- " avoid terminal hanging
-- augroup auto_close_term
-- autocmd!
-- autocmd TermClose * execute 'bdelete! ' . expand('<abuf>')
-- augroup END
-- ]]
