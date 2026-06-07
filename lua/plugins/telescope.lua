return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup({})

      -- keymaps
      vim.keymap.set('n', '<leader>ff', builtin.find_files,  { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep,   { desc = 'Search in files' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers,     { desc = 'Find open buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags,   { desc = 'Search help' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Show diagnostics' })
    end,
  },
}
