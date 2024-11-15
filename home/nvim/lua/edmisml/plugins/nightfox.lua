return {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'nightfox'
  end,
  config = function()
    require('nightfox').setup {
      options = {
        styles = {
          keywords = 'italic,bold',
        },
      },
    }
  end,
}
