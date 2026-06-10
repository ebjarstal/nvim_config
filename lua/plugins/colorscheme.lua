return {
  {
    'datsfilipe/vesper.nvim',
    lazy = false,    -- the main colorscheme: load it during startup
    priority = 1000, -- and load it before any other plugin
    config = function()
      require('vesper').setup({
        -- Let the terminal's (black) background show through, matching the
        -- transparency autocmd in init.lua.
        transparent = true,
        italics = {
          comments  = true,
          keywords  = true,
          functions = false,
          strings   = false,
          variables = false,
        },
      })
      vim.cmd.colorscheme('vesper')
    end,
  },
}
