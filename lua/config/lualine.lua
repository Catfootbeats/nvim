local icons = require("icons")

local filetype = {
    'filetype',
    colored = true,
    cond = function()
        return vim.bo.buftype == '' and vim.fn.winwidth(0) > 80
    end,
}
local filename = {
    'filename',
    file_status = true,
    path = 1,
    cond = function()
        return vim.bo.buftype == ''
    end,
    fmt = function (str)
        return str:gsub("^term://.*$", require'options'.nerd_fonts and " " or "[terminal]")
    end,
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then
                vim.cmd[[NvimTreeToggle]]
            end
        end
    end,
}
local diagnostics = {
    'diagnostics',
    cond = function()
        return vim.fn.winwidth(0) > 80
    end,
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then
                vim.cmd[[Trouble diagnostics toggle focus=false]]
            elseif (mouse == "r") then
                vim.cmd[[Trouble diagnostics toggle focus=false filter.buf=0]]
            end
        end
    end,
}
local branch = {
    'branch',
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then
                vim.cmd[[Neogit]]
            end
        end
    end,
}
local diff = {
    'diff',
    colored = true,
    diff_color = {
        added    = 'diffAdded',
        modified = 'diffChanged',
        removed  = 'diffRemoved',
    },
    cond = function()
        return vim.fn.winwidth(0) > 80
    end,
}
local ctime = {
    'ctime',
    format = '%m/%d %H:%M',
}
local encoding = {
    'encoding',
    fmt = string.upper,
    cond = function()
        return vim.fn.winwidth(0) > 80 and 'utf-8' ~= vim.o.fileencoding
    end,
    show_bomb = true,
}
local location = {
    'location',
    cond = function()
        return vim.bo.buftype == ''
    end,
    show_bomb = true,
}
local aerial = {
    'aerial',
    cond = function()
        return vim.bo.buftype == ''
    end,
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then
                vim.cmd[[AerialToggle]]
            end
        end
    end,
}

if require'options'.nerd_fonts then
    branch.icon = icons.git.Branch
    diff.symbols = { added = ' ', modified = ' ', removed = ' ' }
    filetype.icon = icons.documents.File
    filetype.icon_only = false
    filetype.icon = { align = 'left' }
    filetype.fmt = function (str) return str:gsub("%s*$", "") end
    filename.symbols = {
        modified = icons.git.Mod,
        readonly = icons.git.Remove,
        unnamed = icons.git.Untrack,
        newfile = icons.git.Add,
      }
    ctime.icon = icons.ui.Clock
else
    diagnostics.symbols = { error = 'E', warn = 'W', info = 'I', hint = '?' }
    branch.icon = ''
end

require'lualine'.setup {
    options = {
        disabled_filetypes = { "alpha", "dashboard", "Outline" },
        theme = 'auto',
        component_separators = {
            left = "|",
            right = "|",
        },
        section_separators = {
            left = " ",
            right = " ",
        },
        globalstatus = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {branch, diagnostics},
        lualine_c = {filename},
        lualine_x = {
            "filesize",
            {
                "fileformat",
                symbols = {
                    unix = ' LF',
                    dos = ' CRLF',
                    mac = ' CR',
                },
            },
            "encoding",
            "filetype",
        },
        lualine_y = {'searchcount', 'quickfix', 'progress'},
        lualine_z = {'location'},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {filename},
        lualine_x = {location},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = { aerial },
        lualine_y = { ctime },
        lualine_z = {},
    },
    inactive_winbar = {},
    extensions = { "nvim-tree" },
}
