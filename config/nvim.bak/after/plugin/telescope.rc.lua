local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    mapptings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  pickers = {
  },
  extensions = {
  }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
