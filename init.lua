vim.opt.relativenumber = true
vim.opt.number = true
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('config.lazy')
