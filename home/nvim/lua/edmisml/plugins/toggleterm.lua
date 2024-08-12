-- toggletermtog
-- https://github.com/akinsho/toggleterm.nvim

return {
  'akinsho/toggleterm.nvim',
  version = '2.12.0',
  config = function()
    function _G.set_terminal_keymaps(term)
      local opts = { buffer = 0 }
      if term.cmd ~= 'lazygit' then
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', [[<C-\><C-n>]], opts)
      end

      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

    local Terminal = require('toggleterm.terminal').Terminal

    local amm = Terminal:new { cmd = 'amm', display_name = 'ammonite_repl', hidden = true }

    function _AMM_TOGGLE()
      amm:toggle()
    end

    vim.keymap.set('n', '<leader>ta', '<cmd>:lua _AMM_TOGGLE()<CR>', { desc = '[T]oggle [a]mmonite terminal' })

    require('toggleterm').setup {
      size = 15,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'horizontal',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }
  end,
}
