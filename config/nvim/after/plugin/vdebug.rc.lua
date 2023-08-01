local status, vdebug = pcall(require, 'vdebug')
if (not status) then return end

vdebug.setup {}
