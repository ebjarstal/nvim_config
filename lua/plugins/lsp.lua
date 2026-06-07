return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('mason-lspconfig').setup({
        -- LSP servers to install automatically
        ensure_installed = {
          'lua_ls',       -- Lua (for editing your nvim config)
          'pyright',      -- Python
          'ts_ls',        -- TypeScript / JavaScript
          'clangd',       -- C / C++
        },
        automatic_installation = true,
      })

      -- This runs once for every buffer where an LSP attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set('n', 'gd',        vim.lsp.buf.definition,      opts)
          vim.keymap.set('n', 'K',         vim.lsp.buf.hover,           opts)
          vim.keymap.set('n', 'gi',        vim.lsp.buf.implementation,  opts)
          vim.keymap.set('n', 'gr',        vim.lsp.buf.references,      opts)
          vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename,          opts)
          vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action,     opts)
	  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,	opts)
        end,
      })
    end,
  },
}
