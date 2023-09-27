local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'cocopon/iceberg.vim'
end)

-- compile plugins
vim.api.nvim_create_augroup('compile_plugins', {})
vim.api.nvim_create_autocmd('BufWritePost', {
  group = 'compile_plugins',
  pattern = { 'plugins.lua' },
  command = "PackerCompile",
})
