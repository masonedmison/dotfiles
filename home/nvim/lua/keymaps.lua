-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- unload buffer
vim.keymap.set('n', '<leader>bu', ':bd <CR>', { desc = '[B]uffer [U]nload' })

-- Close all buffers but the current buffer not including toggleterm buffers.
-- If the current buffer is a toggleterm terminal, this is a noop.
vim.keymap.set('n', '<leader>bc', function()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  -- get buffers that are not toggleterm buffers
  local function non_toggterm(bufs)
    local non_toggterms = {}
    local toggterm_curr = false
    for _, bi in ipairs(bufs) do
      local bufname = vim.api.nvim_buf_get_name(bi)
      local maybe_togg_term = string.find(bufname, 'toggleterm')
      if not maybe_togg_term then
        table.insert(non_toggterms, bi)
      elseif maybe_togg_term and bi == current_buf then
        toggterm_curr = true
        break
      end
    end

    return toggterm_curr, non_toggterms
  end
  local curr_is_term, filtered_buffs = non_toggterm(bufs)
  if curr_is_term then
    print 'Current buffer is a terminal!'
  else
    for _, i in ipairs(filtered_buffs) do
      if i ~= current_buf then
        vim.api.nvim_buf_delete(i, {})
      end
    end
  end
end, { desc = '[B]uffer [C]lose all but current' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Open netrw
vim.keymap.set('n', '<leader>e', ':Lex 20 <cr>')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Trim trailing whitespace
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  command = [[%s/\s\+$//e]],
})

-- vim: ts=2 sts=2 sw=2 et
