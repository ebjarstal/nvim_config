return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter', -- only load once you start typing
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup({
        check_ts = true, -- Treesitter-aware: don't add pairs inside strings, etc.
      })

      -- When you confirm a function/method from nvim-cmp, also insert its `()`.
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
