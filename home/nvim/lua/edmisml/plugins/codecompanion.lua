return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  init = function()
    vim.cmd [[cab cc CodeCompanion]]
  end,
  opts = {
    adapters = {
      anthropic = function()
        return require('codecompanion.adapters').extend('anthropic', {
          env = {
            api_key = "cmd:sed 's/[[:space:]]*$//' ~/tokens/anthropic-token.txt",
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = 'anthropic',
      },
      inline = {
        adapter = 'anthropic',
      },
    },
  },
  keys = {
    {
      '<leader>tc',
      '<cmd>CodeCompanionChat Toggle<cr>',
      mode = { 'n', 'v' },
      noremap = true,
      silent = true,
      desc = '[T]oggle [C]hat',
    },
    {
      '<leader>cd',
      '<cmd>CodeCompanionChat add<cr>',
      mode = 'v',
      noremap = true,
      silent = true,
      desc = '[C]odeCompanion A[D]d to chat',
    },
    {
      '<leader>cc',
      '<cmd>CodeCompanionActions<cr>',
      mode = { 'n', 'v' },
      noremap = true,
      silent = true,
      desc = '[C]odeCompanion a[C]tions',
    },
  },
}
