local status, lualine = pcall(require, "lualine")
if not status then
  vim.notify("没有找到 lualine")
  return
end

-- local cmake = require("config.cmake-tools")
local icons = require("icons")

local config = {
  options = {
    -- 指定皮肤
    -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
    -- theme = "tokyonight"
    theme = "everforest", -- Can also be "auto" to detect automatically.
    -- 分割线
    component_separators = {
      left = "|",
      right = "|",
    },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = {
      left = " ",
      right = "",
    },
    globalstatus = true
  },
  extensions = { "nvim-tree" },
  sections = {
    lualine_c = {
      'lsp_progress'
      -- "filename",
      
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        symbols = {
          unix = ' LF', -- e712
          dos = ' CRLF', -- e70f
          mac = ' CR', -- e711
        },
      },
      "encoding",
      "filetype",
    },
  },

}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- ins_left {
--   function()
--     local c_preset = cmake.get_configure_preset()
--     return "CMake: [" .. (c_preset and c_preset or "-") .. "]"
--   end,
--   icon = icons.ui.Search,
--   cond = function()
--     return cmake.is_cmake_project() and cmake.has_cmake_preset()
--   end,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeSelectConfigurePreset")
--       end
--     end
--   end
-- }
-- 
-- ins_left {
--   function()
--     local type = cmake.get_build_type()
--     return "CMake: [" .. (type and type or "") .. "]"
--   end,
--   icon = icons.ui.Search,
--   cond = function()
--     return cmake.is_cmake_project() and not cmake.has_cmake_preset()
--   end,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeSelectBuildType")
--       end
--     end
--   end
-- }
-- 
-- ins_left {
--   function()
--     local kit = cmake.get_kit()
--     return "[" .. (kit and kit or "-") .. "]"
--   end,
--   icon = icons.ui.Pencil,
--   cond = function()
--     return cmake.is_cmake_project() and not cmake.has_cmake_preset()
--   end,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeSelectKit")
--       end
--     end
--   end
-- }
-- 
-- ins_left {
--   function()
--     return "Build"
--   end,
--   icon = icons.ui.Gear,
--   cond = cmake.is_cmake_project,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeBuild")
--       end
--     end
--   end
-- }
-- 
-- ins_left {
--   function()
--     local b_preset = cmake.get_build_preset()
--     return "[" .. (b_preset and b_preset or "-") .. "]"
--   end,
--   icon = icons.ui.Search,
--   cond = function()
--     return cmake.is_cmake_project() and cmake.has_cmake_preset()
--   end,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeSelectBuildPreset")
--       end
--     end
--   end
-- }
-- 
-- ins_left {
--   function()
--     local b_target = cmake.get_build_target()
--     return "[" .. (b_target and b_target or "-") .. "]"
--   end,
--   cond = cmake.is_cmake_project,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeSelectBuildTarget")
--       end
--     end
--   end
-- }
-- 
-- ins_left {
--   function()
--     return icons.ui.Debug
--   end,
--   cond = cmake.is_cmake_project,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeDebug")
--       end
--     end
--   end
-- }
-- 
-- ins_left {
--   function()
--     return icons.ui.Run
--   end,
--   cond = cmake.is_cmake_project,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeRun")
--       end
--     end
--   end
-- }
-- 
-- ins_left {
--   function()
--     local l_target = cmake.get_launch_target()
--     return "[" .. (l_target and l_target or "-") .. "]"
--   end,
--   cond = cmake.is_cmake_project,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeSelectLaunchTarget")
--       end
--     end
--   end
-- }

ins_left {
    "lsp_progress",
    spinner_symbols = { " ", " ", " ", " ", " ", " " },
}
lualine.setup(config)
