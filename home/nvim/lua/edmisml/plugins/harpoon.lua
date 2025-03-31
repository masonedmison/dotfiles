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

    --vim.keymap.set('n', 'hm', ':Telescope harpoon marks<CR>', { desc = 'Open harpoon window' })
    vim.keymap.set('n', 'hm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

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
    vim.keymap.set('n', 'ha', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', 'hs', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', 'hd', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', 'hf', function()
      harpoon:list():select(4)
    end)
  end,
}
