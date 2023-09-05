local telescope = require('telescope')
telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["<CR>"] = "select_tab"
      },
      i = {
        ["<CR>"] = "select_tab"
      }
    }
  }
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function() builtin.find_files({ hidden = true }) end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
