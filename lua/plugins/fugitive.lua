local open_cmd = 'xdg-open'
if vim.fn.has 'wsl' == 1 then
  open_cmd = 'wslview'
elseif vim.fn.has 'mac' == 1 then
  open_cmd = 'open'
end

vim.api.nvim_create_user_command('Browse', function(opts)
  vim.fn.system { open_cmd, opts.fargs[1] }
end, {
  desc = 'Enables using GBrowse without netrw',
  force = true,
  nargs = 1,
})

return {

  {
    'tpope/vim-fugitive',
    branch = 'master',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git [S]tatus' })
    end,
    dependencies = { 'tommcdo/vim-fubitive', 'tpope/vim-rhubarb' },
  },
}
