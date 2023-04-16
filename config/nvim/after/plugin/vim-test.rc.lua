local status, vim_test = pcall(require, 'vim-test')
if (not status) then return end

vim_test.setup {}
