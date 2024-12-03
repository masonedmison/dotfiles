return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'mdm',
        path = '~/vaults/mdm',
        overrides = {
          daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = 'mdm/dailies',
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = '%Y-%m-%d',
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = '%B %-d, %Y',
            -- Optional, default tags to add to each new daily note created.
            default_tags = { 'daily-notes' },
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = nil,
          },
        },
      },
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ['<leader>oc'] = {
        action = function()
          vim.cmd 'ObsidianTOC'
        end,
        opts = { buffer = true },
      },
      ['<leader>ot'] = {
        action = function()
          vim.cmd 'ObsidianTags'
        end,
        opts = { buffer = true },
      },
      ['<leader>ol'] = {
        action = function()
          vim.cmd 'ObsidianBacklinks'
        end,
        opts = { buffer = true },
      },
      ['<leader>od'] = {
        action = function()
          vim.cmd 'ObsidianDailies'
        end,
        opts = { buffer = true },
      },
    },
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart { 'open', url } -- Mac OS
      -- vim.ui.open(url) -- need Neovim 0.10.0+
    end,
  },
}
