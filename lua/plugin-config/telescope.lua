local status, actions = pcall(require, "telescope.actions")
if (not status) then
  return
end

--local actions = require('telescope.actions')
-- Global remapping
------------------------------
require("telescope").setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["l"] = actions.file_edit
      }
    },
    file_ignore_patterns = {"./node_modules"}
  },
}

--按键设置
vim.api.nvim_set_keymap("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>sf", [[<cmd>lua require('telescope.builtin').file_browser()<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>/", [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>]], {})
