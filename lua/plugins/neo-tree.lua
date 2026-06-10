return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- file icons (needs a Nerd Font)
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true, -- close Neo-tree if it's the last window
        filesystem = {
          follow_current_file = { enabled = true }, -- focus the file you're editing
          use_libuv_file_watcher = true,            -- live-refresh on fs changes
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        window = {
          width = 32,
        },
      })

      -- keymaps
      vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle<cr>',          { desc = 'Toggle file explorer' })
      vim.keymap.set('n', '<leader>fe', '<cmd>Neotree reveal<cr>',         { desc = 'Reveal current file in tree' })
    end,
  },
}
