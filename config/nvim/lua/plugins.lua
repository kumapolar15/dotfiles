local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'cocopon/iceberg.vim'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = '*',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'lewis6991/gitsigns.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'norcalli/nvim-colorizer.lua'
  use 'dstein64/vim-startuptime'
end)

-- compile plugins
vim.api.nvim_create_augroup('compile_plugins', {})
vim.api.nvim_create_autocmd('BufWritePost', {
  group = 'compile_plugins',
  pattern = { 'plugins.lua' },
  command = "PackerCompile",
})
