local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then return end

lspsaga.setup({
  ui = {
    winblend = 10,
    border = 'single',
    devicon = true,
    title = true,
    expand = '⊞',
    collapse = '⊟',
    code_action = '💡',
    actionfix = '',
    lines = { '┗', '┣', '┃', '━', '┏' },
    kind = {},
    imp_sign = '',
  }
})

local function show_documentation()
  local ft = vim.opt.filetype._value
  if ft == 'vim' or ft == 'help' then
    vim.cmd([[execute 'h ' . expand('<cword>') ]])
  else
    vim.cmd([[Lspsaga hover_doc]])
  end
end

vim.keymap.set('n', 'K', show_documentation)
vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', 'grn', '<cmd>Lspsaga rename<CR>')
vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set('n', ']e',  '<cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', 'grf', '<cmd>Lspsaga finder<CR>')
vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>')
vim.keymap.set('n', 'ge', '<cmd>Lspsaga show_line_diagnostics<CR>')
