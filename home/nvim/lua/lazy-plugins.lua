-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'edmisml/plugins/gitsigns',

  require 'edmisml/plugins/which-key',

  require 'edmisml/plugins/telescope',

  require 'edmisml/plugins/lspconfig',

  require 'edmisml/plugins/conform',

  require 'edmisml/plugins/cmp',

  require 'edmisml/plugins/tokyonight',

  require 'edmisml/plugins/todo-comments',

  require 'edmisml/plugins/mini',

  require 'edmisml/plugins/treesitter',

  require 'edmisml.plugins.autopairs',

  require 'edmisml.plugins.toggleterm',

  require 'edmisml.plugins.toggleterm-manager',

  require 'edmisml.plugins.metals',

  require 'edmisml.plugins.lazygit',

  -- require 'edmisml.plugins.markdown-preview',

  require 'edmisml.plugins.trouble',

  require 'edmisml.plugins.bufferline',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
