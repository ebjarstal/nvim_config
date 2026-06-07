vim.opt.relativenumber = true
vim.opt.number = true
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.tabstop = 4       -- how wide a tab character displays
vim.opt.shiftwidth = 4    -- how wide an indent is (>, <, autoindent)
vim.opt.expandtab = true  -- insert spaces instead of a tab character

vim.opt.timeout = true
vim.opt.timeoutlen = 300  -- ms to wait before which-key popup appears

require('config.lazy')

-- Transparent background: let the terminal's background show through
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
  end,
})
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
