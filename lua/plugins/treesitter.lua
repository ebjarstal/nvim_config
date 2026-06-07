return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- On the `main` branch, parsers are installed imperatively rather than
      -- via an `ensure_installed` table.
      require('nvim-treesitter').install({
        'lua', 'vim', 'vimdoc',
        'python', 'javascript', 'typescript', 'c', 'cpp',
        -- Used to highlight the code blocks inside LSP hover (`K`) popups.
        'markdown', 'markdown_inline',
      })

      -- The `main` branch no longer enables highlighting via a `highlight`
      -- option; you start it per-buffer. This starts treesitter for any buffer
      -- whose language has a parser installed, and silently does nothing
      -- otherwise.
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
