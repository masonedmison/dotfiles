return {
  'ray-x/lsp_signature.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function(_, opts)
    local lspsig = require 'lsp_signature'

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local bufnr = args.buf
        lspsig.on_attach(nil, bufnr)
      end,
    })
    lspsig.setup(opts)
  end,
}
