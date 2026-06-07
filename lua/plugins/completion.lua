return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'lukas-reineke/cmp-under-comparator',  -- add this
    },
    config = function()
      local cmp = require('cmp')
      local comparators = require('cmp-under-comparator')

      cmp.setup({
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            comparators.under,              -- demotes irrelevant items
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>']     = cmp.mapping.abort(),
          ['<CR>']      = cmp.mapping.confirm({ select = true }),
          ['<Tab>']     = cmp.mapping.select_next_item(),
          ['<S-Tab>']   = cmp.mapping.select_prev_item(),
        }),
        performance = {
            debounce = 500, -- ms to wait after typing before showing completion
        },
        completion = {
            autocomplete = {
                require('cmp.types').cmp.TriggerEvent.TextChanged,
            },
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.config('*', { capabilities = capabilities })
    end,
  },
}
