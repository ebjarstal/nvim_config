vim.opt.relativenumber = true
vim.opt.number = true
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.tabstop = 4       -- how wide a tab character displays
vim.opt.shiftwidth = 4    -- how wide an indent is (>, <, autoindent)
vim.opt.expandtab = true  -- insert spaces instead of a tab character

require('config.lazy')
