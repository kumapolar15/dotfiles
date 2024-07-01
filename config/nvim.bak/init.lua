if vim.g.vscode then
  require ('vscode')
else
  require('base')
  require('highlight')
  require('keymap')

  require('plugins')
end
