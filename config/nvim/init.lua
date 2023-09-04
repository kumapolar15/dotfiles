require('base')
require('highlights')
require('maps')

require('plugins')
vim.api.nvim_create_augroup('plugins_compile', {})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = 'plugins_compile',
  pattern = { 'plugins.lua' },
  command = "PackerCompile",
})

local my_filetype = require('filetype')
vim.api.nvim_create_augroup('vimrc_augroup', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'vimrc_augroup',
  pattern = '*',
  callback = function(args) my_filetype[args.match]() end
})

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('macos')
end
if is_win then
  require('windows')
end
