return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bufdelete = { enabled = true },
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    lazygit = { enabled = true },
    -- picker = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    -- bufdelete
    {
      '<leader>bc',
      function()
        Snacks.bufdelete.other()
      end,
      desc = '[B]uffer [C]lose',
    },
    -- ****
    -- lazygit
    {
      '<leader>lg',
      function()
        Snacks.lazygit.open()
      end,
      desc = '[L]azy [G]it',
    },
    {
      '<leader>lf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = '[L]azy Git [F]ilter',
    },
    -- ****
  },
}
