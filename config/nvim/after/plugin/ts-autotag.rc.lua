local status, autotag = pcall(require, 'nvim-ts-autopairs')
if (not status) then return end

autotag.setup {}
