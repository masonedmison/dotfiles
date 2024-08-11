return {
  'navarasu/onedark.nvim',
  priority = 1000, -- Ensure it loads first
  init = function()
    vim.cmd.colorscheme 'onedark'
  end,
  config = function()
    require('onedark').setup {
      style = 'cool',
    }
  end,
}
