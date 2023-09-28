local status, config_local = pcall(require, 'config-local')
if (not status) then return end

config_local.setup({
  config_files = { '.nvim/local.vim', '.nvim/local.lua' },
  hashfile = vim.fn.stdpath('data') .. '/config-local',
  autocommands_create = true,
  commands_create = true,
  silent = true,
})
