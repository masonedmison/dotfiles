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
    display = {
      chat = {
        show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
        show_settings = true, -- Show LLM settings at the top of the chat buffer?
        show_token_count = true, -- Show the token count for each response?
        start_in_insert_mode = false, -- Open the chat buffer in insert mode?
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
    {
      '<leader>cn',
      '<cmd>CodeCompanionChat<cr>',
      mode = { 'n', 'v' },
      noremap = true,
      silent = true,
      desc = '[C]odeCompanionChat [N]ew',
    },
  },
}
