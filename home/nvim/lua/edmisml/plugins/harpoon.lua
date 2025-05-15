return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon.setup {
      settings = {
        mark_branch = true,
        tabline = false,
        tabline_prefix = '  ',
        tabline_suffix = '  ',
        save_on_toggle = true,
      },
    }

    vim.keymap.set('n', ',m', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', ',x', function()
      harpoon:list():add()
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', ',p', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', ',n', function()
      harpoon:list():next()
    end)
  end,
}
