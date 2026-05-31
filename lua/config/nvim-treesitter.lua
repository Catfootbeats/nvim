require'nvim-treesitter'.setup {
    ensure_installed = {
        "c", "cpp", "cmake", "lua", "vim", "vimdoc",
        "query", "elixir", "heex", "javascript", "html",
        "css", "bash", "glsl", "markdown", "json", "kotlin", "python",
    },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '+',
            node_incremental = '+',
            node_decremental = '-',
        }
    },
    indent = {
        enable = true,
    },
}

-- Textobjects (nvim-treesitter-textobjects)
require'nvim-treesitter-textobjects'.setup {
    select = {
        enable = true,
        lookahead = true,
        keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["as"] = { query = "@scope", query_group = "locals" },
            ["az"] = { query = "@fold", query_group = "folds" },
            ["ai"] = "@call.outer",
            ["ii"] = "@call.inner",
            ["ad"] = "@conditional.outer",
            ["id"] = "@conditional.inner",
            ["ae"] = "@loop.outer",
            ["ie"] = "@loop.inner",
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["at"] = "@comment.outer",
            ["it"] = "@comment.inner",
            ["ar"] = "@return.outer",
            ["ir"] = "@return.inner",
            ["al"] = "@statement.outer",
            ["il"] = "@statement.inner",
            ["an"] = "@number.outer",
            ["in"] = "@number.inner",
            ["ah"] = "@assignment.outer",
            ["ih"] = "@assignment.inner",
        },
        selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@statement.outer'] = 'V',
            ['@assignment.outer'] = 'V',
            ['@block.outer'] = 'V',
            ['@loop.outer'] = 'V',
            ['@conditional.outer'] = 'V',
            ['@class.outer'] = 'V',
        },
        include_surrounding_whitespace = false,
    },
    swap = {
        enable = true,
        swap_next = {
            ["ml"] = "@parameter.inner",
            ["mj"] = "@statement.outer",
            ["mip"] = "@parameter.inner",
            ["mib"] = "@block.outer",
            ["mil"] = "@statement.outer",
            ["mif"] = "@function.outer",
            ["mic"] = "@class.outer",
            ["min"] = "@number.inner",
        },
        swap_previous = {
            ["mh"] = "@parameter.inner",
            ["mk"] = "@statement.outer",
            ["map"] = "@parameter.inner",
            ["mab"] = "@block.outer",
            ["mal"] = "@statement.outer",
            ["maf"] = "@function.outer",
            ["mac"] = "@class.outer",
            ["man"] = "@number.inner",
        },
    },
    move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]s"] = { query_group = "locals", query = "@scope" },
            ["]z"] = { query = "@fold", query_group = "folds" },
            ["]i"] = "@call.*",
            ["]d"] = "@conditional.*",
            ["]o"] = "@loop.*",
            ["]p"] = "@parameter.inner",
            ["]b"] = "@block.outer",
            ["]t"] = "@comment.*",
            ["]r"] = "@return.inner",
            ["]l"] = "@statement.*",
            ["]n"] = "@number.*",
            ["]h"] = "@assignment.outer",
        },
        goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]S"] = { query = "@scope", query_group = "locals" },
            ["]Z"] = { query = "@fold", query_group = "folds" },
            ["]I"] = "@call.*",
            ["]D"] = "@conditional.*",
            ["]E"] = "@loop.*",
            ["]P"] = "@parameter.inner",
            ["]B"] = "@block.outer",
            ["]T"] = "@comment.*",
            ["]R"] = "@return.inner",
            ["]L"] = "@statement.*",
            ["]N"] = "@number.*",
            ["]H"] = "@assignment.outer",
        },
        goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[s"] = { query = "@scope", query_group = "locals" },
            ["[z"] = { query = "@fold", query_group = "folds" },
            ["[i"] = "@call.*",
            ["[d"] = "@conditional.*",
            ["[e"] = "@loop.*",
            ["[p"] = "@parameter.inner",
            ["[b"] = "@block.outer",
            ["[t"] = "@comment.*",
            ["[r"] = "@return.inner",
            ["[l"] = "@statement.*",
            ["[n"] = "@number.*",
            ["[h"] = "@assignment.outer",
        },
        goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[S"] = { query = "@scope", query_group = "locals" },
            ["[Z"] = { query = "@fold", query_group = "folds" },
            ["[I"] = "@call.*",
            ["[D"] = "@conditional.*",
            ["[E"] = "@loop.*",
            ["[P"] = "@parameter.*",
            ["[B"] = "@block.outer",
            ["[T"] = "@comment.*",
            ["[R"] = "@return.inner",
            ["[L"] = "@statement.*",
            ["[N"] = "@number.*",
            ["[H"] = "@assignment.outer",
        },
    },
    lsp_interop = {
        enable = true,
        border = 'none',
        floating_preview_opts = {},
        peek_definition_code = {
            ["gsf"] = "@function.outer",
            ["gsc"] = "@class.outer",
        },
    },
}

-- Context commentstring (nvim-ts-context-commentstring)
require'ts_context_commentstring'.setup {}
vim.g.skip_ts_context_commentstring_module = true

-- Matchup
vim.g.matchup_matchparen_offscreen = { method = "status" }
vim.g.matchup_surround_enabled = 1
vim.g.matchup_delim_noskips = 2

-- Autotag (nvim-ts-autotag)
require'nvim-ts-autotag'.setup {
    enable = true,
}
