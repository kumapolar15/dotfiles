local keymap = vim.keymap

vim.g.mapleader = ' '

keymap.set("n", "<leader>ff", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')")
