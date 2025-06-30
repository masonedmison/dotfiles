return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bufdelete = { enabled = true },
    explorer = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ['<S-k>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
            ['<S-j>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
          },
        },
      },
      previewers = {
        diff = {
          builtin = false, -- use Neovim for previewing diffs (true) or use an external tool (false)
          cmd = { 'delta' }, -- example to show a diff with delta
        },
        git = {
          builtin = false, -- use Neovim for previewing git output (true) or use git (false)
        },
      },
    },
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
    -- ********
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
    -- ********
    -- git
    {
      '<leader>bl',
      function()
        Snacks.git.blame_line()
      end,
      desc = '[B]lame [L]ine',
    },
    -- ****
    -- gitbrowse
    {
      '<leader>go',
      function()
        Snacks.gitbrowse.open()
      end,
      desc = '[G]itbrowse [O]pen',
    },
    -- ****
    -- Exporer and Picker
    -- Top Pickers & Explorer
    {
      '<leader>sf',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },

    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    -- find
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = 'Recent',
    },
    -- git
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Git Log',
    },
    {
      '<leader>gL',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = 'Git Log Line',
    },
    {
      '<leader>gd',
      function()
        Snacks.picker.git_diff()
      end,
      desc = 'Git Diff (Hunks)',
    },
    -- Grep
    {
      '<leader>/',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Buffer Lines',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    {
      '<leader>s/',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Grep Open Buffers',
    },
    -- {
    --   '<leader>sg',
    --   function()
    --     Snacks.picker.grep()
    --   end,
    --   desc = 'Grep',
    -- },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = 'Registers',
    },
    {
      '<leader>si',
      function()
        Snacks.picker.search_history()
      end,
      desc = 'Search History',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sj',
      function()
        Snacks.picker.jumps()
      end,
      desc = 'Jumps',
    },
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = 'Marks',
    },
    {
      '<leader>sq',
      function()
        Snacks.picker.qflist()
      end,
      desc = 'Quickfix List',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      '<leader>su',
      function()
        Snacks.picker.undo()
      end,
      desc = 'Undo History',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Keymaps',
    },
    -- LSP
    -- TODO
    -- {
    --   'gd',
    --   function()
    --     Snacks.picker.lsp_definitions()
    --   end,
    --   desc = 'Goto Definition',
    -- },
    -- {
    --   'gD',
    --   function()
    --     Snacks.picker.lsp_declarations()
    --   end,
    --   desc = 'Goto Declaration',
    -- },
    -- {
    --   'gr',
    --   function()
    --     Snacks.picker.lsp_references()
    --   end,
    --   nowait = true,
    --   desc = 'References',
    -- },
    -- {
    --   'gI',
    --   function()
    --     Snacks.picker.lsp_implementations()
    --   end,
    --   desc = 'Goto Implementation',
    -- },
    -- {
    --   'gy',
    --   function()
    --     Snacks.picker.lsp_type_definitions()
    --   end,
    --   desc = 'Goto T[y]pe Definition',
    -- },
    -- {
    --   '<leader>ss',
    --   function()
    --     Snacks.picker.lsp_symbols()
    --   end,
    --   desc = 'LSP Symbols',
    -- },
    -- {
    --   '<leader>sS',
    --   function()
    --     Snacks.picker.lsp_workspace_symbols()
    --   end,
    --   desc = 'LSP Workspace Symbols',
    -- },
  },
}
