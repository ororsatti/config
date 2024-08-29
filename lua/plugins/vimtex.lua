vim.api.nvim_create_augroup('VimTeX', { clear = true })

return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'skim'
  end,
  config = function()
    vim.api.nvim_create_autocmd('BufReadPre', {
      pattern = '/path/to/project/*.tex',
      callback = function()
        print('changing vimtex main', vim.b.vimtex_main)
        vim.b.vimtex_main = '/path/to/project/main.tex'
      end,
      group = 'VimTeX',
    })
  end,
}
