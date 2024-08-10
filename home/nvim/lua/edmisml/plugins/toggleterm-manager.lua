return {
  'ryanmsnyder/toggleterm-manager.nvim',
  dependencies = {
    'akinsho/nvim-toggleterm.lua',
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim', -- only needed because it's a dependency of telescope
  },

  config = function()
    vim.keymap.set('n', '<leader>tt', '<cmd>:Telescope toggleterm_manager<CR>', { desc = '[T]oggle [t]oggleterm_manager' })
  end,
}
