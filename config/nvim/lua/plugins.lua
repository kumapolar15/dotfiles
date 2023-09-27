local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'cocopon/iceberg.vim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = '*',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'dstein64/vim-startuptime'
end)

-- compile plugins
vim.api.nvim_create_augroup('compile_plugins', {})
vim.api.nvim_create_autocmd('BufWritePost', {
  group = 'compile_plugins',
  pattern = { 'plugins.lua' },
  command = "PackerCompile",
})
