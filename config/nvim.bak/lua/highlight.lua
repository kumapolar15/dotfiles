vim.wo.cursorline = true
vim.o.termguicolors = true
vim.o.winblend = 0
vim.o.wildoptions = 'pum'
vim.o.pumblend = 5
vim.o.background = 'dark'
vim.api.nvim_create_augroup( 'TransparentBG', {} )
vim.api.nvim_create_autocmd( 'Colorscheme', {
  pattern = '*',
  group = 'TransparentBG',
  callback = function()
    vim.api.nvim_set_hl(0, 'Normal', {ctermbg=none})
    vim.api.nvim_set_hl(0, 'EndOfBuffer', {ctermbg=none})
    vim.api.nvim_set_hl(0, 'NonText', {ctermbg=none})
    vim.api.nvim_set_hl(0, 'Folded', {ctermbg=none})
    vim.api.nvim_set_hl(0, 'LineNr', {ctermbg=none})
    vim.api.nvim_set_hl(0, 'SignColumn', {ctermbg=none})
  end,
})
