local shared = require 'utils'
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      {
        'letieu/harpoon-lualine',
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
      },
    },
    config = function()
      require('lualine').setup {
        options = { theme = 'kanagawa' },
        sections = {
          lualine_c = {
            {
              'harpoon2',
              indicators = shared.harpoon_bindings,
              active_indicators = shared.map(shared.harpoon_bindings, function(v)
                return string.upper(v)
              end),
              separator = ' ',
            },
            'filename',
          },
        },
      }
    end,
  },
}
