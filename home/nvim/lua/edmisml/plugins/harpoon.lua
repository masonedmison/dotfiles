return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon.setup {
      global_settings = {
        mark_branch = true,
        tabline = false,
        tabline_prefix = '  ',
        tabline_suffix = '  ',
      },
    }
    --
    -- basic telescope configuration
    require('telescope').load_extension 'harpoon'

    vim.keymap.set('n', 'hm', ':Telescope harpoon marks<CR>', { desc = 'Open harpoon window' })

    vim.keymap.set('n', 'hx', function()
      harpoon:list():add()
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', 'hp', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', 'hn', function()
      harpoon:list():next()
    end)
  end,
}
