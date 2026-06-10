return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- NOTE: the `main` branch compiles parsers with the external `tree-sitter`
      -- CLI (must be on PATH). Install it once, e.g. drop the prebuilt binary in
      -- ~/.local/bin:  https://github.com/tree-sitter/tree-sitter/releases
      -- Without it, `:TSInstall`/`install()` fail with "ENOENT: 'tree-sitter'".
      --
      -- On the `main` branch, parsers are installed imperatively rather than
      -- via an `ensure_installed` table.
      require('nvim-treesitter').install({
        'lua', 'vim', 'vimdoc',
        'python', 'javascript', 'typescript', 'tsx', 'c', 'cpp',
        'go', 'gomod', 'gosum',           -- Go (+ go.mod / go.sum)
        'typst',                          -- Typst (.typ)
        'html', 'css', 'json', 'yaml',    -- web / config
        'bash', 'dockerfile', 'make',     -- scripts / build
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
