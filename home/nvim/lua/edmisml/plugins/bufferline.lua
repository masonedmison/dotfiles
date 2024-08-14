return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true

    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { desc = '[B]uffer [P]ick' })

    vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineCycleNext<CR>', { desc = '[B]uffer [N]ext' })
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineCyclePrev<CR>', { desc = '[B]uffer [P]revious' })

    vim.keymap.set('n', '<leader>b1', '<cmd>BufferLineGoToBuffer 1<CR>', { desc = '[B]uffer 1' })
    vim.keymap.set('n', '<leader>b2', '<cmd>BufferLineGoToBuffer 2<CR>', { desc = '[B]uffer 2' })
    vim.keymap.set('n', '<leader>b3', '<cmd>BufferLineGoToBuffer 3<CR>', { desc = '[B]uffer 3' })
    vim.keymap.set('n', '<leader>b4', '<cmd>BufferLineGoToBuffer 4<CR>', { desc = '[B]uffer 4' })
    vim.keymap.set('n', '<leader>b5', '<cmd>BufferLineGoToBuffer 5<CR>', { desc = '[B]uffer 5' })
    vim.keymap.set('n', '<leader>b6', '<cmd>BufferLineGoToBuffer 6<CR>', { desc = '[B]uffer 6' })

    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ''
          for e, n in pairs(diagnostics_dict) do
            local sym = e == 'error' and '' or (e == 'warning' and '' or '')
            if sym ~= '' then
              s = s .. ' ' .. n .. sym
            end
          end
          return s
        end,
      },
    }
  end,
}
