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
