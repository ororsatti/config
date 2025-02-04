return {
  'stevearc/oil.nvim',
  name = 'oil',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      use_default_keymaps = true,
      keymaps = {
        ['<C-t>'] = false,
        ['<C-g>'] = false,
        ['C-b'] = { 'actions.select', opts = { vertical = true } },
        ['-'] = 'actions.parent',
      },
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
      },
      win_options = {
        wrap = true,
      },
    }
    vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
