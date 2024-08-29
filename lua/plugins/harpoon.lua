local shared = require 'utils'

return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = "Add current file to harpoon's list" })

      vim.keymap.set('n', shared.harpoon_notation 'E', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle harpoon quick menu' })

      for i = 1, #shared.harpoon_bindings do
        vim.keymap.set('n', shared.harpoon_notation(shared.harpoon_bindings[i]), function()
          harpoon:list():select(i)
        end, { desc = string.format('Harpoon: Go to the $s file', shared.get_index_name(i)) })
      end

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-E-P>', function()
        harpoon:list():prev()
      end, { desc = 'Harpoon: go to prev' })
      vim.keymap.set('n', '<C-E-N>', function()
        harpoon:list():next()
      end, { desc = 'Harpoon: go to next' })
    end,
  },
  {
    'letieu/harpoon-lualine',
    dependencies = {
      {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
      },
    },
  },
}
